require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/tag' )



get '/tags/total' do
  @tags = Tag.all
  erb(:"tag/total_tag")
end 

