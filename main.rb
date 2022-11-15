require_relative './menu_choice'

$menu_choice = MenuChoice.new

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
  print 'Enter you choice : '
  choice = gets.chomp.to_i
end

def prompt_user
  choice = menu
  choice == 7 ? $menu_choice.exit_app : $menu_choice.option_case(choice)
  prompt_user
end

def main
  puts "\nWelcome to the School Library App built in Ruby!"
  prompt_user
end

main
