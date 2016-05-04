

$(document).on('ready page:load', function(){

    $('.reward > a').on('click', function(event){
        event.preventDefault();
        event.stopImmediatePropagation();
      $.ajax({
        method: 'POST',
        URL: $(this).attr('href'),
        dataType: 'html',
        success: function(returned_info){
          console.log('ok, post succeded.')
        }
      });
    });
});
