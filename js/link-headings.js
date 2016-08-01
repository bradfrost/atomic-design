$('h2,h3,h4,h5').filter('[id]').each(function () {
<<<<<<< HEAD
    $(this).html('<a href="#'+$(this).attr('id')+'">' + $(this).text() + '</a>');
=======
    $(this).html('<a href="#'+$(this).attr('id')+'">' + '#' + '</a>' + $(this).text());
>>>>>>> origin/master
});