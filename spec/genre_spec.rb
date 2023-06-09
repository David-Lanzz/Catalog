require_relative '../classes/item'
require_relative '../classes/genre'

describe Genre do
  item = Item.new('2023-06-05')
  genre = Genre.new('Thriller')
  genre.add_item(item)

  it "Should expect genre to be an instance of the class 'Genre'" do
    expect(genre).to be_instance_of(Genre)
  end
end
