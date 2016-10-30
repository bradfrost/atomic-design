$('.text h2, .text h3, .text h4, .text h5').filter('[id]').each(function () {
    $(this).html('<a href="#'+$(this).attr('id')+'" class="title-link">' + '#' + '</a>' + $(this).text());
});
