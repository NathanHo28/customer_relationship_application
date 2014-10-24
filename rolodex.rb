class Rolodex
	attr_reader :contacts
	@@index = 1000 #if this was to be a class variable, the identifier would be unique on a global level
	
	def initialize
		@contacts = []
	end

	def add_contact(contact)
		contact.id = @@index #add the unique identifier onto the contact
		@@index += 1
		@contacts << contact
	end

	def delete_contact(id_delete)
		@contacts.delete_if {|contact| contact.id = id_delete }
	end
end