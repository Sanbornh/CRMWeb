require 'sinatra'

get '/' do 
	erb :index
end

get '/contacts/new' do 
	erb :new_contact
end

