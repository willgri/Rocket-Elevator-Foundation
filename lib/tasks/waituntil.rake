namespace :waituntil do
  desc "TODO"
  task wait: :environment do
    # rake waituntil:wait  


    attempt = 1
    WaitUtil.wait_for_condition('my event', :verbose => true, :timeout_sec => 3, :delay_sec => 1) do
      sleep(1)
      attempt += 1
      # puts attempt

      

      [false, "attempt #{attempt}"]  # the second element goes into the log message
    end

  end

end
