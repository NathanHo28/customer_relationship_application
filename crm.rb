require_relative './contact.rb' #logically separating by class and by file
require_relative './rolodex.rb'

class CRM
	attr_accessor :name
	def initialize(name) #.new means initialize and is looking for this method first.
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
		puts "Enter a number: "
	end


	def main_menu
		puts "Welcome to #{@name}"
		while true
			print_main_menu
			input = gets.chomp.to_i
			choose_option(input) #passing off the input into another method
			return if input == 7
		end
		# puts "input at main_menu: #{input}" #1
	end

	def choose_option(option)
		case option #case can be on multiple lines like if statement or one line.
		when 1 then add_contact
		when 2 then modify_contact
		when 3 then display_all_contacts
		when 4 then display_one_contact
		when 5 then display_attribute
		when 6 then delete_contact
		when 7
			puts "Goodbye!"
			return
		else "Invalid input. Try again!"
		end
			
		# puts "input at choose_option: #{option}" #1
		# option = 12
		# puts "input at choose_option (after change) #{option}" #12
	end

	def add_contact
		print "First Name: "
		first_name = gets.chomp
		print "Last Name: "
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
			puts "#{contact.first_name} #{contact.last_name} <#{contact.email}> (#{contact.id}"
		end
	end

	def delete_contact
		puts "Please enter the contact id you would like to delete (ie. 1xxx): "
		id_delete = gets.chomp.to_i
		@rolodex.delete_contact(id_delete)
		puts "ID #{id_delete} has been deleted!"
	end
end


crm = CRM.new("Bitmaker Labs CRM")
crm.main_menu



