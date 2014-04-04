require 'sinatra'
# require './contact'
require './database'
require 'data_mapper'

DataMapper.setup(:default, "sqlite3:database.sqlite3")

class Contact
	include DataMapper::Resource
		property :id, Serial
		property :first_name, String
		property :last_name, String
		property :email, String
		property :notes, String 
end

DataMapper.finalize
DataMapper.auto_upgrade!


@@database = Database.new
@@database.add_to_database(Contact.new("Sanborn", "Hilland", "sanbornh@rogers.com", "note note note"))
@@database.add_to_database(Contact.new("Tim", "ber", "tim@gmail.com", "note note note"))


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
	contact = Contact.create(
		:first_name => params[:first_name]
		:last_name => params[:last_name]
		:email => params[:email]
		:notes => params[:notes]
		)
	redirect to('/contacts/view')
end

get '/contacts/:id' do 
	@contact = @@database.find_by(params[:id].to_i)
	if @contact
		erb :show_contact
	else
		raise Sinatra::NotFound
	end
end

get '/contacts/:id/edit' do
	@contact = @@database.find_by(params[:id].to_i)
	if @contact
		erb :edit_contact
	else
		raise Sinatra::NotFound
	end
end

put "/contacts/:id" do
  @contact = @@database.find_by(params[:id].to_i)	
  if @contact then
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.notes = params[:note]
    redirect to("/contacts/view")
  else
    raise Sinatra::NotFound
  end
end

delete "/contacts/:id" do
  @contact = @@database.find_by(params[:id].to_i)
  if @contact
    @@database.remove(@contact)
    # binding.pry
    redirect to("/contacts/view")
  else
    raise Sinatra::NotFound
  end
end


