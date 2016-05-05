

$(document).on('ready page:load', function(){

    $('.reward > a').on('click', function(event){
        event.preventDefault();
        event.stopImmediatePropagation();

      var result = window.confirm('Confirm pledge?');


      if (result) {

        $.ajax({
          method: 'POST',
          url: $(this).attr('href'),
          data: {
            reward_id: $(this).attr('data')
          },
          dataType: 'html',
          success: function(returned_info){
            console.log('ok, post succeded.');

            $('.modal-thanks').animate({
              opacity: 1}, 500).delay(10000).animate({opacity: 0}, 500);

          }
        });
      }

    });
});
