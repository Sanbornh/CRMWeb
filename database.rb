# require 'yaml'

class Database

	attr_accessor :contacts, :highest_id

	def initialize
		@contacts = []
	end

	def add_to_database(contact)
		@contacts << contact
	end

	def remove(contact)
		@contacts.delete(contact)
	end

	def display
		@contacts.each { |contact| contact.display }
	end

	# def find_first(name)
	# 	@contacts.each do |contact|
	# 		if contact.first_name.upcase == name then @return_value = contact end
	# 	end
	# 	return @return_value
	# end

	# def find_last(name)
	# 	@contacts.each do |contact|
	# 		if contact.last_name.upcase == name then @return_value = contact end
	# 	end
	# 	return @return_value
	# end

	def find_by(id)
		@contacts.find { |contact| contact.id == id}
	end
end

