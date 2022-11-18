require_relative '../book'
require_relative '../classroom'

describe Book do
  context 'Create Book 1st Instance' do
    it 'will verify instance of Book class' do
      @book = Book.new('Oriaro\'s Life', 'Walter Okumu')
      expect(@book).to be_an_instance_of(Book)
    end
  end

  context 'Check the value Instance' do
    it 'will check the `title` of instance of Book class' do
      @book = Book.new('Oriaro\'s Life', 'Walter Okumu')
      expect(@book.title).to eql('Oriaro\'s Life')
    end
    it 'will check the `author` of instance of Book class' do
      @book = Book.new('Oriaro\'s Life', 'Walter Okumu')
      expect(@book.author).to eql('Walter Okumu')
    end
  end
end