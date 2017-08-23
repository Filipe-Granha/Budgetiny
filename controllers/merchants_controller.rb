require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/merchant.rb' )



get '/merchants/total' do
  @merchants = Merchant.all
  erb(:"merchant/total_merchant")
end 

 