class Contact

	@@contact_id = 999
	attr_accessor :first_name, :last_name, :email, :notes, :id

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

	def display
		puts @first_name
		puts @last_name
		puts @email
		puts @notes
	end
end