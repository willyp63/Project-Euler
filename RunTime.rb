require 'Time'

def run_time(&prc)
  before_time = Time.now
  prc.call
  Time.now - before_time
end
