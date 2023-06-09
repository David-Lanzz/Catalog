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

  context '#items' do
    it 'should return an array' do
      expect(label.items).to be_a Array
    end
  end
end
