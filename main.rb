require_relative './app'

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

def option_case(choice)
  case choice
  when 1
    list_all_books
  when 2
    list_all_people
  when 3
    create_person
  when 4
    create_book
  when 5
    create_rental
  when 6
    list_rentals_by_id
  else
    puts 'Incorrect choice, choose a number between 1..7'
  end
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
