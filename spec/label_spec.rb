require './classes/book'
require './classes/label'

describe Label do
  label = Label.new('new label', 'red')

  context '#title' do
    it 'should have a title' do
      expect(label.title).to eq 'new label'
      expect(label.color).to eq 'red'
    end
  end

  context 'should return random numbers' do
    it 'should return random numbers' do
      expect(label.id).to be_between(1, 1000)
    end
  end

  context '#add_item' do
    it 'adds an item to the label' do
      book = Book.new('Bloomsbury', 'good', 'Fiction', 'J.K. Rowling', 'bookstore', '2022-11-11', 'Harry Potter')
      label.add_item(book)
      expect(label.items.length).to eq 1
    end
  end
end
