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

# 	def initialize(first_name, last_name, email, note)	
# 		@notes = Array.new(1, note)
# 		@first_name = first_name
# 		@last_name = last_name
# 		@email = email
# 		@@contact_id += 1
# 		@id = @@contact_id
# 	end

# 	def set_name
# 		@first_name = name[0]
# 		@last_name = name[1]
# 	end

# 	def new_note
# 		@notes << gets.chomp
# 	end

# 	def self.get_id
# 		@@contact_id
# 	end

# 	def get_id
# 		Contact.get_id
# 	end

# 	def display
# 		puts @first_name
# 		puts @last_name
# 		puts @email
# 		puts @notes
# 	end
# end

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
	new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:notes])
	@@database.add_to_database(new_contact)
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


