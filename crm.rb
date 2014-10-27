#as a user i am presented with a promt to 'add', 'modify', 'diplay all', 
#'display contact', 'diplay attribute', 'delete' and 'exit'.
require_relative './contact.rb'
require_relative './rolodex.rb'
require 'pry'

class CRM
	attr_accessor :name
	def initialize(name) #initialize means new 
		@name = name
		@rolodex = Rolodex.new
	end

	def print_main_menu
		# puts "\e[H\e[2J"
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
		puts "\e[H\e[2J"
		print "First name: "
		first_name = gets.chomp.capitalize
		print "Last name: "
		last_name = gets.chomp.capitalize
		print "Email: "
		email = gets.chomp
		print "Note: "
		note = gets.chomp

		contact = Contact.new(first_name, last_name, email, note)
		@rolodex.add_contact(contact)
	end

	def modify_contact
		# loop do
		puts "\e[H\e[2J"
		display_all_contacts
		puts "Type the contact id number you want to modify I.E. 1xxx: "
		id = gets.chomp.to_i
		@rolodex.find(id)
		loop do
			puts "\e[H\e[2J"
			puts "What do you want to change about the contact?"
			puts "(i.e: first name, last name, email or note)"
			@change = gets.chomp.downcase
			puts "\e[H\e[2J"
			puts "You have chosen to change the #{@change}, is this correct? (Y/N)"
			yes_or_no = gets.chomp.upcase
			if yes_or_no == "Y" then break
			else return
			end
		end
		puts "\e[H\e[2J"
		@rolodex.modify_contact(@change)
	end

	def display_all_contacts
		@rolodex.contacts.each do |contact|
			puts "\e[H\e[2J"
			puts "#{contact.first_name}, #{contact.last_name}, #{contact.email} (#{contact.id})"
			puts " "
		end
	end

	def display_one_contact
		puts "\e[H\e[2J"
		puts "Type the id (ie. 1xxx) of the contact that you would like to display: "
		id = gets.chomp.to_i
		@rolodex.contacts.each do |contact|
			if contact.id == id
				puts " "
				puts "CONTACT INFO: "
				puts "Name: #{contact.last_name.upcase}, #{contact.first_name}"
				puts "Email: #{contact.email}"
				puts "Notes: #{contact.note}"
				puts " "
			end
		end
	end

	def display_attribute
		puts "\e[H\e[2J"
		puts "Please type the id number you want to display (ie. 1xxx): "
		id = gets.chomp.to_i
		@rolodex.find(id)
		puts "\e[H\e[2J"
		puts "What contact attribute would you like to display?"
		puts "(i.e first name, last name, email or note)"
		display = gets.chomp.downcase
		@rolodex.display_attribute(display)
	end

	def delete_contact
		puts "\e[H\e[2J"
		puts "Type the contact id number you want to delete I.E: 1xxx: "
		id_delete = gets.chomp.to_i
		@rolodex.delete_contact(id_delete)
		puts "Contact #{id_delete} was deleted"
	end
end

crm = CRM.new("Bitmaker labs CRM")
crm.main_menu
