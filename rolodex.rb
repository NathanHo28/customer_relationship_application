require "pry"

class Rolodex
attr_reader :contacts
@@index = 1000 #if this was to be a class variable, the identifier would be unique on a global level

	def initialize
		@contacts = [] #empty arrary to hold entire contact list.
	end

	def find(id) #search method to be reused in several other methods.
		@found = @contacts.select{|contact| contact.id == id }.first
	end

	def add_contact(contact)
		contact.id = @@index #add the unique identifier onto the contact
		@@index += 1
		@contacts << contact
	end

	def delete_contact(id_delete)
		@contacts.delete_if{|contact| contact.id == id_delete}
	end

	def modify_contact(change)
		case change
		when "first name"
			puts "New first name: "
			#@found represents the now isolated objected within the array.
			@found.first_name = gets.chomp 
		when "last name"
			puts "New last name: "
			@found.last_name = gets.chomp
		when "email"
			puts "New email: "
			@found.email = gets.chomp
		when "note"
			puts "New notes: "
			@found.note = gets.chomp
		else
			puts "Error use a specified command"
		end
	end

		
end

