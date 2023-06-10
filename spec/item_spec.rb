require 'rspec'
require_relative '../classes/item'

describe Item do
  item = Item.new('2023-06-05')

  item.author = 'Someone'
  item.genre = 'Something'
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
