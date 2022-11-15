require_relative './menu_choice'

def menu
  print <<~DOC
  Please choose an option by entering a number:"
    1 - List all books
    2 - List all people
    3 - Create a person
    4 - Create a book
    5 - Create a rental
    6 - List all rentals for a given person (id)
    7 - Exit App
  DOC
end

def prompt_user
  menu

  choice = gets.chomp.to_i
  choice == 7 ? exit_app : option_case(choice)

  prompt_user
end

def main
  puts "\nWelcome to the School Library App built in Ruby!"
  app = App.new
  app.run
end

main
