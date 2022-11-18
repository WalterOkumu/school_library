require_relative '../rental'
require_relative '../student'
require_relative '../book'

describe Rental do
  context 'Testing for Rental Class' do
    before do
      @student = Student.new(
        'A101',
        25,
        name: 'Aakash',
        parent_permission: false
      )

      @book = Book.new('RSPec Testing', 'ABC')
      @rental = Rental.new('2005/11/22', @student, @book)
    end

    describe 'Testing for Rental Name' do
      it 'will check the rental name should be `Aakash`' do
        expect(@rental.person.name).to eql('Aakash')
      end
    end

    describe 'Testing for Rented Book Title' do
      it 'will check the rented Book Title should be `RSPec Testing`' do
        expect(@rental.book.title).to eql('RSPec Testing')
      end
    end

    describe 'Testing Student Rented Book' do
      it 'will check the number of rented Book by student' do
        expect(@student.rentals.length).to eql(1)
      end
    end
  end
end