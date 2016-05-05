

$(document).on('ready page:load', function(){

    $('#pledge-submit').on('click', function(event){
        event.preventDefault();
        event.stopImmediatePropagation();

      var result = window.confirm('Confirm pledge?');
      var form = $(this).parent();
      var href = form.attr('action');


      if (result) {

        $.ajax({
          method: 'POST',
          url: href,
          data: form.serialize(),
          dataType: 'html',
          success: function(returned_info){
            $('.modal-result').html('Thank you for your support')
            $('.modal-result').css('background-color', 'mediumspringgreen')
            $('.modal-result').animate({
              opacity: 1}, 500).delay(10000).animate({opacity: 0}, 500);
          },
          error: function() {
            $('.modal-result').html('Pledge unsuccessful');
            $('.modal-result').css('background-color', 'tomato')
            $('.modal-result').animate({
              opacity: 1}, 500).delay(10000).animate({opacity: 0}, 500);
          }
        });
      }

    });
});
