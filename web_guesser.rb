require 'sinatra'
require 'sinatra/reloader'

set :number, rand(100)

get '/' do
  erb :index, :locals => { :number => settings.number }
end
