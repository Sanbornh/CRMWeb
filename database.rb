# require 'yaml'

class Database

	attr_accessor :contacts, :highest_id

	def initialize
		@contacts = []
		# load_log
	end

	# def load_log
	# 	# log = File.new("./log.txt")
	# 	# yaml = log.read
	# 	# log = YAML.load(yaml)
	# 	@contacts = []  #log[:database]
	# 	# @highest_id = log[:id]
	# 	# @contacts = []
	# 	# binding.pry
	# end

	def add_to_database(contact)
		@contacts << contact
	end

	def display
		@contacts.each { |contact| contact.display }
	end

	def find_first(name)
		@contacts.each do |contact|
			if contact.first_name.upcase == name then @return_value = contact end
		end
		return @return_value
	end

	def find_last(name)
		@contacts.each do |contact|
			if contact.last_name.upcase == name then @return_value = contact end
		end
		return @return_value
	end
end
