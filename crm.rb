#as a user i am presented with a promt to 'add', 'modify', 'diplay all', 
#'display contact', 'diplay attribute', 'delete' and 'exit'.
require_relative './contact.rb'
require_relative './rolodex.rb'

class CRM
	attr_accessor :name
	def initialize(name) #initialize means new 
		@name = name
		@rolodex = Rolodex.new
	end

	def print_main_menu
		puts "[1] Add a contact"
		puts "[2] Modify a contact"
		puts "[3] Display all contacts"
		puts "[4] Display one contact"
		puts "[5] Display an attribute"
		puts "[6] Delete a contact"
		puts "[7] Exit"
		puts "Enter a number:"
	end

	def main_menu
		puts "Welcome to #{@name}!"

			while true
			print_main_menu
			input = gets.chomp.to_i
			return if input == 7
		choose_option(input)
			end
	end

	def choose_option(option)
		case option
		when 1 then add_contact
		when 2 then modify_contact
		when 3 then display_all_contacts
		when 4 then display_one_contact
		when 5 then display_attribute
		when 6 then delete_contact
		when 7 
			puts "Goodbye!"
		else
			puts "please use one of the given numbers"
		end
	end

	def add_contact
		print "First name: "
		first_name = gets.chomp
		print "Last name: "
		last_name = gets.chomp
		print "Email: "
		email = gets.chomp
		print "Note: "
		note = gets.chomp

		contact = Contact.new(first_name, last_name, email, note)
		@rolodex.add_contact(contact)
	end

	def display_all_contacts
		@rolodex.contacts.each do |contact|
			puts "#{contact.first_name}, #{contact.last_name}, #{contact.email} (#{contact.id})"
		end
	end

	def delete_contact
		puts "Type the contact id number you want to delete I.E: 1xxx: "
		id_delete = gets.chomp.to_i
		@rolodex.delete_contact(id_delete)
		puts "Contact #{id_delete}was deleted"
	end

	def modify_contact
		puts "Type the contact id number you want to modify I.E. 1xxx: "
		id = gets.chomp.to_i
		@rolodex.find(id)
		puts "What do you want to change about the contact?"
		puts "I.E.: first name, last name, email or note."
		change = gets.chomp.downcase
		@rolodex.modify_contact(change)
	end

end

crm = CRM.new("Bitmaker labs CRM")
crm.main_menu
