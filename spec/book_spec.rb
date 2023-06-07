require './classes/book'

describe Book do
  book = Book.new('Bloomsbury', 'good', 'Fiction', 'J.K. Rowling', 'bookstore', '2022-11-11', 'Harry Potter')

  context '#initialize' do
    it 'should create a new book' do
      expect(book).to be_truthy
    end
  end

  context 'cover_state should return good' do
    it 'should return good' do
      expect(book.cover_state).to eq('good')
    end
  end

  context 'can_be_archived?' do
    it 'should return false' do
      expect(book.archived).to eq(false)
    end
  end
end
