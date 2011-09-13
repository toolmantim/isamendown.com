require 'sinatra'
require 'sinatra/synchrony'
require "em-synchrony/em-http"

set :views, "."

get '/' do
  http = EventMachine::HttpRequest.new('https://getamen.com/').head :timeout => 5
  @down = http.response_header.empty? || (500..599).include?(http.response_header.status)
  erb :app
end
