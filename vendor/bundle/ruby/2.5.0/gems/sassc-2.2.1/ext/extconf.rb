# frozen_string_literal: true

gem_root = File.expand_path('..', __dir__)
libsass_dir = File.join(gem_root, 'ext', 'libsass')

if !File.directory?(libsass_dir) ||
   # '.', '..', and possibly '.git' from a failed checkout:
   Dir.entries(libsass_dir).size <= 3
  Dir.chdir(gem_root) { system('git submodule update --init') } or
    fail 'Could not fetch libsass'
end

require 'mkmf'

$CXXFLAGS << ' -std=c++11'

# Set to true when building binary gems
if enable_config('static-stdlib', false)
  $LDFLAGS << ' -static-libgcc -static-libstdc++'
end

# Set to false when building binary gems
if enable_config('march-tune-native', true)
  $CFLAGS << ' -march=native -mtune=native'
  $CXXFLAGS << ' -march=native -mtune=native'
end

if enable_config('lto', true)
  $CFLAGS << ' -flto'
  $CXXFLAGS << ' -flto'
  $LDFLAGS << ' -flto'
end

# Disable noisy compilation warnings.
$warnflags = ''
$CFLAGS.gsub!(/[\s+](-ansi|-std=[^\s]+)/, '')

dir_config 'libsass'

libsass_version = Dir.chdir(libsass_dir) do
  if File.exist?('.git')
    ver = %x[git describe --abbrev=4 --dirty --always --tags].chomp
    File.write('VERSION', ver)
    ver
  end
  File.read('VERSION').chomp if File.exist?('VERSION')
end

if libsass_version
  libsass_version_def = %Q{ -DLIBSASS_VERSION='"#{libsass_version}"'}
  $CFLAGS << libsass_version_def
  $CXXFLAGS << libsass_version_def
end

$INCFLAGS << " -I$(srcdir)/libsass/include"
$VPATH << "$(srcdir)/libsass/src"
Dir.chdir(__dir__) do
  $VPATH += Dir['libsass/src/*/'].map { |p| "$(srcdir)/#{p}" }
  $srcs = Dir['libsass/src/**/*.{c,cpp}']
end

MakeMakefile::LINK_SO << "\nstrip -x $@"

# Don't link libruby.
$LIBRUBYARG = nil

# Disable .def file generation for mingw, as it defines an
# `Init_libsass` export which we don't have.
MakeMakefile.send(:remove_const, :EXPORT_PREFIX)
MakeMakefile::EXPORT_PREFIX = nil

if RUBY_ENGINE == 'jruby' &&
   Gem::Version.new(RUBY_ENGINE_VERSION) < Gem::Version.new('9.2.8.0')
  # COUTFLAG is not set correctly on jruby<9.2.8.0
  # See https://github.com/jruby/jruby/issues/5749
  MakeMakefile.send(:remove_const, :COUTFLAG)
  MakeMakefile::COUTFLAG = '-o $(empty)'

  # CCDLFLAGS is not set correctly on jruby<9.2.8.0
  # See https://github.com/jruby/jruby/issues/5751
  $CXXFLAGS << ' -fPIC'
end

create_makefile 'sassc/libsass'
