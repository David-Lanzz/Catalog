require './classes/item'
require './classes/genre'

describe Genre do
  item = Item.new('Something', 'Someone', 'Source', 'DMW', '2023-06-05')
  genre = Genre.new('Thriller')
  genre.add_item(item)

  it "Should expect genre to be an instance of the class 'Genre'" do
    expect(genre).to be_instance_of(Genre)
  end
end
