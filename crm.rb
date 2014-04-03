require 'sinatra'
require './contact'
require './database'

@@database = Database.new

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

post '/contacts' do
	new_contact = Contact.new(params["first_name"], params["last_name"], params["email"], params["note"])
	@@database.add_to_database(new_contact)
	binding.pry
	redirect to('/contacts/view')
end