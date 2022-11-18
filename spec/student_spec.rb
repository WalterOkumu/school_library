require_relative '../student'

describe Student do
  context 'Testing for Rental Class' do
    before do
      @student = Student.new(
        'A101',
        25,
        name: 'Aakash',
        parent_permission: false
      )
    end

    describe 'Testing for Student Name' do
      it 'will check the Student name should be `Aakash`' do
        expect(@student.name).to eql('Aakash')
      end
    end

    describe 'Testing for Student Age' do
      it 'will check the Student age should be 25' do
        expect(@student.age).to eql(25)
      end
    end

  end
end