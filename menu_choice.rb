require_relative './app'
require_relative 'file_handler'

class MenuChoice
  def initialize
    @app = App.new
    @file = FileHandler.new
    @app.book_loader
    @app.people_loader
    @app.rental_loader
  end

  def option_case(choice)
    case choice
    when 1
      @app.list_all_books
    when 2
      @app.people_list?
    when 3
      @app.create_person
    when 4
      @app.create_book
    when 5
      @app.create_rental
    when 6
      @app.list_rentals_by_id
    else
      puts 'Incorrect choice, choose a number between 1..7'
    end
  end

  def exit_app
    @file.save(@app.people_, @app.people_temp)
    puts 'Thank you for using this School Library App built in Ruby!'
    exit
  end
end
