require 'sinatra/base'
my_app = Sinatra.new { get('/') { "hi" } }
my_app.run!