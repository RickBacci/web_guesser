require 'sinatra'
require 'sinatra/reloader'

set :number, rand(100)

get '/' do
  guess = params['guess'].to_i

  message =
    if guess < settings.number
      settings.number - guess > 5 ? 'Way to low!':'Too low!'
    elsif guess > settings.number
      guess - settings.number > 5 ? 'Way to high!':'Too high!'
    else
      "You got it right!"
    end

  erb :index, :locals => { :number => settings.number, :message => message }
end
