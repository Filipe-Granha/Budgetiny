require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/merchants_controller')
require_relative('controllers/tags_controller')
require_relative('controllers/transactions_controller')
require_relative('controllers/thoughts_controller')
 

#the app will automatically look for the files inside a folder called 'views'

get '/' do        #url
  erb(:"index")   #file from the 'views' folder which will be displayed in the url
end


get '/about_us' do
  erb(:"about_us")
end

