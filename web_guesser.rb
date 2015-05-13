require 'sinatra'
require 'sinatra/reloader'

set :number, rand(100)

get '/' do
  "The secret number is #{settings.number}"
end
