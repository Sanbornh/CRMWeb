require 'sinatra'
require './contact'

get '/' do 
	erb :index
end

get '/contacts/new' do 
	erb :new_contact
end

get '/contacts/view' do 
	erb :view_contacts
end

get '/contacts/modify' do 
	erb :modify_contacts
end