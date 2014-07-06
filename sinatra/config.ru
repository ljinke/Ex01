# config.ru (run with rackup -p 4567)
require './my_app'
run MyApp

#Classic Style Application with a config.ru
#require './app'
#run Sinatra::Application