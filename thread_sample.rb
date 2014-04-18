require 'net/http'

uri = URI('http://localhost')

p 15.times {
  5.times.map {
    Thread.new { Net::HTTP.get_response(uri) }
  }.each(&:join)
}