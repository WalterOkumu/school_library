require 'json'
require_relative './classroom'
require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'
require_relative 'file_handler'

class App
  attr_accessor :people_temp, :rentals_temp, :book_temp
  attr_reader :books, :people, :rentals, :people_, :book_, :rentals_

  def initialize
    @books = []
    @people = []
    @rentals = []
    @book_temp = []
    @people_temp = []
    @rentals_temp = []
    @book_ = 'books.json'
    @people_ = 'people.json'
    @rentals_ = 'rentals.json'
  end

  def people_list?
    if @people.empty?
      puts 'There are no entries, please add people'
    else
      list_all_people
    end
  end

  def list_all_people
    puts "People's list, count(#{@people.count}) :\n\n"
    @people.each_with_index do |person, index|
      puts "#{index + 1}) Type: #{person.type}, Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def person_choice
    puts 'To create a student (press 1) or a teacher (press 2)?'
    gets.chomp.to_i
  end

  def create_person
    choice = person_choice
    case choice
    when 1
      student_obj = register_student
      @people << Student.new(
        student_obj['classroom'],
        student_obj['age'],
        name: student_obj['name'],
        parent_permission: student_obj['permission']
      )
      puts "The student '#{student_obj['name']}' aged '#{student_obj['age']}' with the classroom '
      #{student_obj['classroom']}' was created successfully!"

    when 2
      teacher_obj = register_teacher
      @people << Teacher.new(teacher_obj['specs'], teacher_obj['age'], name: teacher_obj['name'])
      puts "The teacher '#{teacher_obj['name']}' aged '#{teacher_obj['age']}' with specialization in '
      #{teacher_obj['specs']}' was created successfully!"

    else
      puts 'Incorrect entry, please select between 1 or 2'
      create_person
    end
  end

  def register_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Classroom: (A101, A102, ... E106) '
    classroom = gets.chomp.upcase
    print 'Name: '
    name = gets.chomp
    has_permission = permission?
    {
      'classroom' => classroom,
      'age' => age,
      'name' => name,
      'permission' => has_permission
    }
  end

  def register_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Specialization: '
    specialization = gets.chomp
    print 'Name: '
    name = gets.chomp
    {
      'name' => name,
      'age' => age,
      'specs' => specialization
    }
  end

  def permission?
    print 'Has parent permission? [Y/N]:'
    permission = gets.chomp

    case permission
    when 'n', 'N'
      false
    when 'y', 'Y'
      true
    else
      puts 'Incorrect choice, kindly enter \'y\', \'Y\' or \'n\', \'N\''
      permission?
    end
  end

  def list_all_books
    if @books.empty?
      puts 'A sad library is an empty library, please add some books'
    else
      puts "Books list, count(#{@books.count}) :\n\n"
      @books.each_with_index do |book, index|
        puts "#{index + 1}) Title: '#{book.title}', Author: #{book.author}"
      end
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book unless @books.include?(book)

    puts "The book '#{title}' by #{author} was created successfully!"
  end

  def list_rentals_by_id
    print "Enter a person's ID: "
    person_id = gets.chomp.to_i
    if !@people.find { |person| person.id == person_id }
      puts "No rental found with ID: #{person_id}"
    elsif @rentals.empty?
      puts 'The rental list is empty, add some rentals...'
    else
      puts "Rentals list, count(#{@people.count}) :\n\n"
      @rentals.select do |rental|
        if rental.person.id == person_id
          puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
        end
      end
    end
  end

  def create_rental
    print "Select a book from the following list by number:\n"
    list_all_books
    prompt_user if @books.empty?
    book_index = gets.chomp.to_i - 1

    print "Select a person from the following list by number:\n"
    list_all_people
    prompt_user if @people.empty?
    person_index = gets.chomp.to_i - 1

    print 'Date [yyyy/mm/dd] : '
    date = gets.chomp

    rental = Rental.new(date, @people[person_index], @books[book_index])
    @rentals << rental unless @rentals.include?(rental)

    puts 'Rental successfully created!'
  end
end
