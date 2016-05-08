function divmod(qty, unit) {
  arr = [];
  arr.push(parseInt(qty/unit));
  arr.push(qty%unit);
  return arr
}



$(document).on('ready page:load', function(){
  var time_sec = parseInt($("#time-sec").attr('data'));
  var count = time_sec;

  function counter() {
    count--;
    return count;
  }
  var temp = setInterval( function () {
    remaining_time(count);
    counter();
  }, 1000);

  function remaining_time(time_sec) {
    var minsec = divmod(time_sec, 60); //[total_time_in_min,remaining_sec]
    var seconds = minsec[1];
    var hourmin = divmod(minsec[0], 60);  //[total_time_in_hr,remaining_min]
    var mins = hourmin[1];
    var dayhour = divmod(hourmin[0], 24);  //[total_time_in_days,remaining_hr]
    var hours = dayhour[1];
    var days = dayhour[0];

    var output = days + " days, " + hours + " hours, " + mins + " minutes, " + seconds + " seconds remaining."
    $('#time-sec').html(output);
  }



});
