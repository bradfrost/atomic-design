$('h2,h3,h4,h5').filter('[id]').each(function () {
    $(this).html('<a href="#'+$(this).attr('id')+'">' + '#' + '</a>' + $(this).text());
});
