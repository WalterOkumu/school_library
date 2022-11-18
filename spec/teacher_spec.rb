require_relative '../teacher'

describe Teacher do
  context 'Testing for Teacher Class' do
    before do
      @teacher = Teacher.new(
        'Physics',
        25,
        name: 'Prof Code Reviewer'
      )
    end

    describe 'Testing for Teacher Name' do
      it 'will check the Teacher name should be `Aakash`' do
        expect(@teacher.name).to eql('Prof Code Reviewer')
      end
    end

    describe 'Testing for Teacher Age' do
      it 'will check the Teacher age should be 25' do
        expect(@teacher.age).to eql(25)
      end
    end
  end
end
