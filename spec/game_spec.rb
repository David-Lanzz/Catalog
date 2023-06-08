require_relative '../classes/item'
require_relative '../classes/game'

describe Game do
  game = Game.new('2012-12-12', true, '2019-01-01')

  describe '#initialize' do
    it 'should initialize a game ' do
      expect(game).to be_a(Game)
    end

    it 'should have game publish_date = 2012-12-12 ' do
      expect(game.publish_date).to eq('2012-12-12')
    end

    it 'should have multiplayer to be true ' do
      expect(game.multiplayer).to eq(true)
    end

    it 'should have game last_played_at date = 2019-01-01' do
      expect(game.last_played_at).to eq('2019-01-01')
    end
  end

  describe '#can_be_archived' do
    it 'should return false' do
      expect(game.archived).to eq(false)
    end
  end
end
