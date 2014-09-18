require 'sinatra'
require 'haml'
require_relative 'car_roulette'

get '/' do
  redirect to('/northland')
end

get '/northland' do
  @cars = NorthlandTrip.new.cars
  haml :northland
end