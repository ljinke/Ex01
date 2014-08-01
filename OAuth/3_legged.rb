#he three parties (legs) involved are the Service Provider, Consumer, and User

require 'rubygems'
require 'oauth'

# like in the above example, you'll want to create a consumer
consumer_key = "GZqz7iOeYourKey4mqSyLQ"
consumer_secret = "MZQP66s5YourSecretHereP9n4nA1U"
consumer = OAuth::Consumer.new(consumer_key, consumer_secret,
                               :site => "http://api.justin.tv",
                               :request_token_path => "/oauth/request_token",
                               :authorize_path => "/oauth/authorize",
                               :access_token_path => "/oauth/access_token",
                               :http_method => :get)

# then you'll start the process by requesting a request token from Justin.tv
# you'll want to send the user along with an oauth_callback parameter, which will be the url
# that your user will be sent to after they authenticate
request_token = consumer.get_request_token
session[:request_token] = request_token
redirect_to request_token.authorize_url + "&oauth_callback=" + CGI.escape("http://my.url.com")


#on the callback endpoint

access_token = request_token.get_access_token
# make a GET request
get_results = access_token.get "/api/user/show/justin.xml"
# make a POST request
post_results = access_token.post "/api/user/update.xml", { "name" => "Justin Kan" }