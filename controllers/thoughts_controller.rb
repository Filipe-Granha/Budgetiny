require('sinatra')
require('sinatra/contrib/all')
require( 'pry-byebug' )
require_relative( '../models/thought' )



get '/thoughts' do
  @thoughts = Thought.all
  erb (:"thoughts")
end 
