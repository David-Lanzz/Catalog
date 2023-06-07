require './classes/book'
require './classes/label'
require './classes/item'

describe Book do
  label = Label.new('new label', 'red')
  book = Book.new('Bloomsbury', 'good', 'Fiction', 'J.K. Rowling', 'bookstore', '2022-11-11', label)

  context '#label' do
    it 'should have a label' do
      expect(book.label).to eq label
    end
  end

  context 'title' do
    it 'should have a title' do
      expect(book.label.title).to eq 'new label'
    end
  end

  context 'color' do
    it 'should have a color' do
      expect(book.label.color).to eq 'red'
    end
  end

  context '#publisher' do
    it 'should have a publisher' do
      expect(book.publisher).to eq 'Bloomsbury'
    end
  end

  context '#genre' do
    it 'should have a genre' do
      expect(book.genre).to eq 'Fiction'
    end
  end

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
