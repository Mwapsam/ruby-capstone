require_relative '../app/book'
require_relative '../app/item'

describe Book do
  before :each do
    @book = Book.new('bad', 'Marriage', 'longhorn', Time.new(2021, 0o5, 16), true)
  end

  context 'When testing the Book class' do
    it 'should have an object with the instance of Book' do
      book_class = @book.class

      expect(book_class).to be Book
    end

    it 'returns true if parent method returns true OR if cover_state equals to "bad"' do
      @book.move_to_archive
      expect(@book.archived).to eql true
    end

    it 'inherits from Item class' do
      expect(@book).to be_kind_of(Item)
    end
  end
end
