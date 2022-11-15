require_relative './app'

class MenuChoice
  def initialize
    @app = App.new
  end

  def option_case(choice)
    case choice
    when 1
      @app.list_all_books
    when 2
      @app.list_all_people
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
    puts 'Thank you for using this School Library App built in Ruby!'
    exit
  end
end