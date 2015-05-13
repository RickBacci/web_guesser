require 'sinatra'
require 'sinatra/reloader'

set :number, rand(100)

get '/' do
  number  = settings.number
  guess   = params['guess'] unless params['guess'].nil?
  message = check_guess(guess)
  winner  = winner?(number, guess)
  params.delete 'guess'
  erb :index, :locals => { :number => number, :message => message, :winner => winner }
end

def check_guess(guess)
  number = settings.number
  return 'Pick a number between 1 and 100' if guess.nil? || guess.empty?
  guess = guess.to_i

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
