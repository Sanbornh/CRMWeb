require 'sinatra'
require './contact'
require './database'

get '/' do 
	erb :index
end

get '/contacts/new' do 
	erb :new_contact
end

get '/contacts/view' do 
	@@contacts = []
	@@contacts << Contact.new("Julie", "Hache", "julie@bitmakerlabs.com", "Instructor")
  @@contacts << Contact.new("Will", "Richman", "will@bitmakerlabs.com", "Co-Founder")
  @@contacts << Contact.new("Chris", "Johnston", "chris@bitmakerlabs.com", "Instructor")

	erb :view_contacts
end

get '/contacts/modify' do 
	erb :modify_contacts
end