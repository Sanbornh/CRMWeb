class Contact

	# binding.pry
	# log = File.new("./log.txt")
	# yaml = log.read
	# log = YAML.load(yaml)
	# binding.pry
	@@contact_id = 0  #log[:id]
	attr_reader :first_name, :last_name, :email, :notes

	def initialize(first_name, last_name, email, note)	
		@notes = Array.new(1, note)
		@first_name = first_name
		@last_name = last_name
		@email = email

		@@contact_id += 1
		@id = @@contact_id
	end

	def set_name
		@first_name = name[0]
		@last_name = name[1]
	end

	def new_note
		@notes << gets.chomp
	end

	def self.get_id
		@@contact_id
	end

	def get_id
		Contact.get_id
	end
end