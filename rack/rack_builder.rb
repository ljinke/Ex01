require 'rubygems'
require 'rack'

infinity = Proc.new {|env| [200, {"Content-Type" => "text/html"}, ["root"]]}
builder = Rack::Builder.new do
  use Rack::CommonLogger

  map '/' do
    run infinity
  end

  map '/version' do
    run Proc.new {|env| [200, {"Content-Type" => "text/html"}, ["infinity 0.1"]] }
  end
end

Rack::Handler::WEBrick.run builder, :Port => 9876
