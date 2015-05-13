require 'sinatra'
require 'sinatra/reloader'

set :number, rand(100)

get '/' do
  number  = settings.number
  guess   = params[:guess]
  message = check_guess(guess)
  winner  = winner?(number, guess)
  cheat   = params[:cheat]

  erb :index, :locals => { :number => number, :message => message, :winner => winner, :cheat => cheat }
end

def check_guess(guess)
  number = settings.number
  guess = guess.to_i
  return 'Pick a number between 1 and 100' if invalid?(guess)

  if too_low?(number, guess)
    way_off?(number, guess) ? 'Way to low!':'Too low!'
  elsif too_high?(number, guess)
    way_off?(number, guess) ? 'Way to high!':'Too high!'
  elsif winner?(number, guess)
    'You got it right!'
  else
    return ''
  end
end

private

def way_off?(number, guess)
  (number - guess).abs > 5
end

def too_low?(number, guess)
  guess < number
end

def too_high?(number, guess)
  guess > number
end

def winner?(number, guess)
  number == guess.to_i
end

def invalid?(guess)
  guess < 1 || guess > 100
end
