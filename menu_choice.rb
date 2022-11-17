require_relative './app'
require_relative 'file_handler'

class MenuChoice
  def initialize
    @app = App.new
    @file = FileHandler.new
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

  def process_people
    @app.people.each do |ppl|
      @app.people_temp << {
        id: ppl.id,
        name: ppl.name,
        age: ppl.age,
        type: ppl.class
      }
    end
  end

  def process_book
    @app.books.each do |bk|
      @app.book_temp << {
        title: bk.title,
        author: bk.author,
      }
    end
  end

  def book_loader
    @app.book_temp = @file.file_handling(@app.book_)
  end

  def people_loader
    @app.people_temp = @file.file_handling(@app.people_)
  end

  def rental_loader
    @app.rentals_temp = @file.file_handling(@app.rentals_)
  end

  def exit_app
    process_people
    process_book
    @file.save(@app.people_, @app.people_temp)
    @file.save(@app.book_, @app.book_temp)
    puts 'Thank you for using this School Library App built in Ruby!'
    exit
  end
end
