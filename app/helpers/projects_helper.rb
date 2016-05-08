module ProjectsHelper

  def time_remaining(end_time)
    time_remain_sec = end_time - Time.now # in seconds

    mm, ss = time_remain_sec.divmod(60)
    hh, mm = mm.divmod(60)
    dd, hh = hh.divmod(24)


      return "%d days, %d hours, %d minutes, and %d seconds remaining" % [dd, hh, mm, ss]
  end


end
