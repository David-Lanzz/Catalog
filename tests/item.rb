require 'rspec'
require './classes/item'

describe Item do
  item = Item.new('Something', 'Someone', 'Source', 'DMW', '2023-06-05')

  it "Should item to be an instance of the class 'Item'" do
    expect(item).to be_instance_of(Item)
  end
  it 'Should exist item author to be Someone' do
    expect(item.author).to eq('Someone')
  end
  it 'Should expect item genre to exist' do
    expect(item.genre).to_not be_nil
  end
end
