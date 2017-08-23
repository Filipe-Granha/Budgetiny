require('sinatra')
require('sinatra/contrib/all')
require( 'pry-byebug' )
require_relative( '../models/transaction' )



get '/transactions' do
  @transactions = Transaction.all
  erb(:"transaction/index")
end


get '/transactions/new' do        
  @transactions = Transaction.all 
  @merchants = Merchant.all       
  @tags = Tag.all                 
  erb(:"transaction/new")           
end


post '/transactions/saved' do 
  transaction = Transaction.new(params) 
  transaction.save                      
  erb(:"transaction/saved")            
end

  
get '/transactions/total' do
  @current_budget = Transaction.current_budget
  @total = Transaction.total_amount_spent
  @merchants = Merchant.all
  @tags = Tag.all
  erb(:"transaction/total")   
end


#delete button
post '/transactions/:id/delete' do  
  Transaction.delete(params[:id])
  redirect to("/transactions")
end 


#edit button
get '/transactions/:id/show' do
  @transaction = Transaction.find(params['id'])
  @merchants = Merchant.all
  @tags = Tag.all
  erb(:"transaction/show")
end


#yes button, after having pressed the edit button
get '/transactions/:id/edit' do
  @transaction = Transaction.find(params['id'])
  @merchants = Merchant.all
  @tags = Tag.all
  erb(:"transaction/edit")
end

 
#update button
post '/transactions/:id/updated' do
  transaction = Transaction.new(params) 
  transaction.update                    
  erb(:"transaction/updated")            
end
 
