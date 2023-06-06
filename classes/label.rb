require './item'

class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color)
    @id = Random.rand
    @title = title
    @color = color
    @items = []
  end
end
