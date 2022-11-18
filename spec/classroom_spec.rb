require_relative '../classroom'
require_relative '../student'

describe Classroom do
  describe 'create student and classroom' do
    before do
      @classroom = Classroom.new('A101')
      @student = Student.new('A101', 12, name: 'Okumu', parent_permission: true)
    end

    describe 'classroom' do
      context 'check and add student' do
        it 'will check the label should be `A101`' do
          expect(@classroom.label).to eql('A101')
        end
        it 'will check the number of student should be 0' do
          expect(@classroom.students.length).to eql(0)
        end
        it 'will check add the student to classroom list should be 1' do
          @classroom.add_student(@student)
          expect(@classroom.students.length).to eql(1)
        end
      end
    end
  end
end
