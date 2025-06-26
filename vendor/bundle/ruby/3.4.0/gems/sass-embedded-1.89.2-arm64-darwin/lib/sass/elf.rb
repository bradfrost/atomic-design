# frozen_string_literal: true

module Sass
  # The {ELF} class.
  #
  # It parses ELF header to extract interpreter.
  # @see https://github.com/torvalds/linux/blob/HEAD/include/uapi/linux/elf.h
  # @see https://github.com/torvalds/linux/blob/HEAD/kernel/kexec_elf.c
  class ELF
    # The {PackInfo} class.
    class PackInfo
      def initialize(format:, sizeof:, struct:)
        @format_le = format.freeze
        @format_be = format.tr('<', '>').freeze
        @sizeof = sizeof.freeze
        @struct = struct.freeze
      end

      attr_reader :sizeof

      def pack(io, data, little_endian)
        raise ArgumentError if io.write(data.values_at(*@struct).pack(format(little_endian))) != @sizeof
      end

      def unpack(io, little_endian)
        @struct.zip(io.read(@sizeof).unpack(format(little_endian))).to_h
      end

      private

      def format(little_endian)
        little_endian ? @format_le : @format_be
      end
    end

    private_constant :PackInfo

    # These constants are for the segment types stored in the image headers
    PT_NULL         = 0
    PT_LOAD         = 1
    PT_DYNAMIC      = 2
    PT_INTERP       = 3
    PT_NOTE         = 4
    PT_SHLIB        = 5
    PT_PHDR         = 6
    PT_TLS          = 7
    PT_LOOS         = 0x60000000
    PT_HIOS         = 0x6fffffff
    PT_LOPROC       = 0x70000000
    PT_HIPROC       = 0x7fffffff

    PN_XNUM         = 0xffff

    # These constants define the different elf file types
    ET_NONE   = 0
    ET_REL    = 1
    ET_EXEC   = 2
    ET_DYN    = 3
    ET_CORE   = 4
    ET_LOPROC = 0xff00
    ET_HIPROC = 0xffff

    EI_NIDENT = 16

    Elf32_Ehdr = PackInfo.new(
      format: "a#{EI_NIDENT}S<2L<5S<6",
      sizeof: 52,
      struct: %i[
        e_ident
        e_type
        e_machine
        e_version
        e_entry
        e_phoff
        e_shoff
        e_flags
        e_ehsize
        e_phentsize
        e_phnum
        e_shentsize
        e_shnum
        e_shstrndx
      ]
    ).freeze

    Elf64_Ehdr = PackInfo.new(
      format: "a#{EI_NIDENT}S<2L<Q<3L<S<6",
      sizeof: 64,
      struct: %i[
        e_ident
        e_type
        e_machine
        e_version
        e_entry
        e_phoff
        e_shoff
        e_flags
        e_ehsize
        e_phentsize
        e_phnum
        e_shentsize
        e_shnum
        e_shstrndx
      ]
    ).freeze

    # These constants define the permissions on sections in the program header, p_flags.
    PF_R = 0x4
    PF_W = 0x2
    PF_X = 0x1

    Elf32_Phdr = PackInfo.new(
      format: 'L<8',
      sizeof: 32,
      struct: %i[
        p_type
        p_offset
        p_vaddr
        p_paddr
        p_filesz
        p_memsz
        p_flags
        p_align
      ]
    ).freeze

    Elf64_Phdr = PackInfo.new(
      format: 'L<2Q<6',
      sizeof: 56,
      struct: %i[
        p_type
        p_flags
        p_offset
        p_vaddr
        p_paddr
        p_filesz
        p_memsz
        p_align
      ]
    ).freeze

    # sh_type
    SHT_NULL     = 0
    SHT_PROGBITS = 1
    SHT_SYMTAB   = 2
    SHT_STRTAB   = 3
    SHT_RELA     = 4
    SHT_HASH     = 5
    SHT_DYNAMIC  = 6
    SHT_NOTE     = 7
    SHT_NOBITS   = 8
    SHT_REL      = 9
    SHT_SHLIB    = 10
    SHT_DYNSYM   = 11
    SHT_NUM      = 12
    SHT_LOPROC   = 0x70000000
    SHT_HIPROC   = 0x7fffffff
    SHT_LOUSER   = 0x80000000
    SHT_HIUSER   = 0xffffffff

    # sh_flags
    SHF_WRITE          = 0x1
    SHF_ALLOC          = 0x2
    SHF_EXECINSTR      = 0x4
    SHF_RELA_LIVEPATCH = 0x00100000
    SHF_RO_AFTER_INIT  = 0x00200000
    SHF_MASKPROC       = 0xf0000000

    # special section indexes
    SHN_UNDEF     = 0
    SHN_LORESERVE = 0xff00
    SHN_LOPROC    = 0xff00
    SHN_HIPROC    = 0xff1f
    SHN_LIVEPATCH = 0xff20
    SHN_ABS       = 0xfff1
    SHN_COMMON    = 0xfff2
    SHN_HIRESERVE = 0xffff

    Elf32_Shdr = PackInfo.new(
      format: 'L<10',
      sizeof: 40,
      struct: %i[
        sh_name
        sh_type
        sh_flags
        sh_addr
        sh_offset
        sh_size
        sh_link
        sh_info
        sh_addralign
        sh_entsize
      ]
    ).freeze

    Elf64_Shdr = PackInfo.new(
      format: 'L<2Q<4L<2Q<2',
      sizeof: 64,
      struct: %i[
        sh_name
        sh_type
        sh_flags
        sh_addr
        sh_offset
        sh_size
        sh_link
        sh_info
        sh_addralign
        sh_entsize
      ]
    ).freeze

    # e_ident[] indexes
    EI_MAG0    = 0
    EI_MAG1    = 1
    EI_MAG2    = 2
    EI_MAG3    = 3
    EI_CLASS   = 4
    EI_DATA    = 5
    EI_VERSION = 6
    EI_OSABI   = 7
    EI_PAD     = 8

    # EI_MAG
    ELFMAG0 = 0x7f
    ELFMAG1 = 0x45
    ELFMAG2 = 0x4c
    ELFMAG3 = 0x46
    ELFMAG  = [ELFMAG0, ELFMAG1, ELFMAG2, ELFMAG3].pack('C*')
    SELFMAG = 4

    # e_ident[EI_CLASS]
    ELFCLASSNONE = 0
    ELFCLASS32   = 1
    ELFCLASS64   = 2
    ELFCLASSNUM  = 3

    # e_ident[EI_DATA]
    ELFDATANONE = 0
    ELFDATA2LSB = 1
    ELFDATA2MSB = 2

    def initialize(io, program_headers: true, section_headers: false)
      io.rewind
      e_ident = io.read(EI_NIDENT).unpack('C*')
      raise ArgumentError unless e_ident.slice(EI_MAG0, SELFMAG).pack('C*') == ELFMAG

      case e_ident[EI_CLASS]
      when ELFCLASS32
        elf_ehdr = Elf32_Ehdr
        elf_phdr = Elf32_Phdr
        elf_shdr = Elf32_Shdr
      when ELFCLASS64
        elf_ehdr = Elf64_Ehdr
        elf_phdr = Elf64_Phdr
        elf_shdr = Elf64_Shdr
      else
        raise EncodingError
      end

      case e_ident[EI_DATA]
      when ELFDATA2LSB
        little_endian = true
      when ELFDATA2MSB
        little_endian = false
      else
        raise EncodingError
      end

      io.rewind
      ehdr = elf_ehdr.unpack(io, little_endian)
      ehdr[:e_ident] = e_ident

      phdrs = if program_headers && ehdr[:e_phnum].positive?
                io.seek(ehdr[:e_phoff], IO::SEEK_SET)
                Array.new(ehdr[:e_phnum]) do
                  elf_phdr.unpack(io, little_endian)
                end
              else
                []
              end

      shdrs = if section_headers && ehdr[:e_shnum].positive?
                io.seek(ehdr[:e_shoff], IO::SEEK_SET)
                Array.new(ehdr[:e_shnum]) do
                  elf_shdr.unpack(io, little_endian)
                end
              else
                []
              end

      @io = io
      @ehdr = ehdr
      @phdrs = phdrs
      @shdrs = shdrs
    end

    def dump(io)
      e_ident = @ehdr[:e_ident]
      raise ArgumentError unless e_ident.slice(EI_MAG0, SELFMAG).pack('C*') == ELFMAG

      ehdr = @ehdr.dup
      ehdr[:e_ident] = e_ident.pack('C*')
      phdrs = @phdrs
      shdrs = @shdrs

      case e_ident[EI_CLASS]
      when ELFCLASS32
        elf_ehdr = Elf32_Ehdr
        elf_phdr = Elf32_Phdr
        elf_shdr = Elf32_Shdr
      when ELFCLASS64
        elf_ehdr = Elf64_Ehdr
        elf_phdr = Elf64_Phdr
        elf_shdr = Elf64_Shdr
      else
        raise EncodingError
      end

      case e_ident[EI_DATA]
      when ELFDATA2LSB
        little_endian = true
      when ELFDATA2MSB
        little_endian = false
      else
        raise EncodingError
      end

      io.rewind
      elf_ehdr.pack(io, ehdr, little_endian)

      io.seek(ehdr[:e_phoff], IO::SEEK_SET) if ehdr[:e_phnum].positive?
      phdrs.each do |phdr|
        elf_phdr.pack(io, phdr, little_endian)
      end

      io.seek(ehdr[:e_shoff], IO::SEEK_SET) if ehdr[:e_shnum].positive?
      shdrs.each do |shdr|
        elf_shdr.pack(io, shdr, little_endian)
      end

      io.flush
    end

    def relocatable?
      @ehdr[:e_type] == ET_REL
    end

    def executable?
      @ehdr[:e_type] == ET_EXEC
    end

    def shared_object?
      @ehdr[:e_type] == ET_DYN
    end

    def core?
      @ehdr[:e_type] == ET_CORE
    end

    def interpreter
      phdr = @phdrs.find { |p| p[:p_type] == PT_INTERP }
      return if phdr.nil?

      @io.seek(phdr[:p_offset], IO::SEEK_SET)
      @io.read(phdr[:p_filesz]).unpack1('Z*')
    end

    INTERPRETER = begin
      proc_self_exe = '/proc/self/exe'
      if File.exist?(proc_self_exe)
        File.open(proc_self_exe, 'rb') do |file|
          elf = ELF.new(file)
          interpreter = elf.interpreter
          if interpreter.nil? && elf.shared_object?
            File.readlink(proc_self_exe)
          else
            interpreter
          end
        end
      end
    end.freeze
  end

  private_constant :ELF
end
