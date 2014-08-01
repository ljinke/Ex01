#the 2 parties (legs) involved are the Service Provider, Consumer
require 'rubygems'
require 'oauth'

# make the consumer out of your secret and key
consumer_key = "mycloud-staging.autodesk.com"
consumer_secret = "Secret123"
consumer = OAuth::Consumer.new(consumer_key, consumer_secret,
                               :site => "https://accounts-staging.autodesk.com",
                               :request_token_path => "/oauth/requesttoken",
                               :authorize_path => "/oauth/authorize",
                               :access_token_path => "/oauth/accesstoken",
                               :http_method => :get)

p "Consumer constructed"

# make the access token from your consumer
access_token = OAuth::AccessToken.new consumer

p "access token received"

p access_token.token
p access_token.secret

# make a signed request!
#access_to.get("/user/show/justin.xml")ken