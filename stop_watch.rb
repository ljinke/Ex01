class StopWatch
    def new()
      @watch_start_time = nil           #Time (in seconds) when the stop watch was started (i.e. the start() method was called).
      @lap_start_time   = nil           #Time (in seconds) when the current lap started.
    end  #def new


    def start()
      myCurrentTime = Time.now()        #Current time in (fractional) seconds since the Epoch (January 1, 1970 00:00 UTC)

      if (!running?) then    
        @watch_start_time = myCurrentTime         
        @lap_start_time   = @watch_start_time
      end  #if

      myCurrentTime - @watch_start_time;
    end  #def start


    def lap_time_seconds()
      myCurrentTime = Time.now()
      myLapTimeSeconds = myCurrentTime - @lap_start_time
      @lap_start_time  = myCurrentTime
      myLapTimeSeconds
    end  #def lap_time_seconds


    def stop()
      myTotalSecondsElapsed = Time.now() - @watch_start_time
      @watch_start_time = nil

      myTotalSecondsElapsed
    end  #def stop


    def running?()
      !@watch_start_time.nil?
    end  #def
  end  #class StopWatch

if __FILE__ == $0

  st = StopWatch.new

  st.start

  sleep(2)

  st.stop

  p st.lap_time_seconds

end