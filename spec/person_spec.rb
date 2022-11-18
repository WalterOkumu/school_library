require_relative '../person'

describe Person do
  context "#person" do
    before do
      @person = Person.new(28, name: 'Aakash Verma', parent_permission: true)
    end

    describe 'Testing Person Class Name' do
      it 'will check the name should "Aakash Verma"' do
        expect(@person.name).to eql("Aakash Verma")
      end
    end

    describe 'Testing Person Class Age' do
      it 'will check the age should 28' do
        expect(@person.age).to eql(28)
      end
    end

    describe 'Testing Person Can Use Services' do
      it 'will check the name should use services' do
        expect(@person.can_use_services?).to be_truthy
      end
    end
  end
end