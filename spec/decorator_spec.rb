require_relative '../trimmer_decorator'
require_relative '../capitalize_decorator'
require_relative '../person'

describe Decorator do
  describe '#Decorator Testing' do
    before do
      @person = Person.new(12, name: "walter okumu oriaro", parent_permission: true)
      @capitalized_person = CapitalizeDecorator.new(@person)
      @capitalized_trimmed_person = TrimmerDecorator.new(@capitalized_person)
    end

    context 'Test For Decorator' do
      describe 'Person name check' do
        it 'will test by checking the person name should be "walter okumu oriaro"' do
          expect(@person.correct_name).to eql("walter okumu oriaro")
        end
      end

      describe 'Capitalize Decorator Test' do
        it 'will test the capitalize text of person name should be "Walter Okumu Oriaro"' do
          expect(@capitalized_person.correct_name).to eql("Walter okumu oriaro")
        end
      end

      describe 'Trimmer Decorator Test' do
        it 'will test the trimmer text of person name should be "Walter Oku"' do
          expect(@capitalized_trimmed_person.correct_name).to eql("Walter oku")
        end
      end
    end
  end
end