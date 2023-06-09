require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, _cover_state, publish_date, label)
    super(publish_date)
    @publisher = publisher
    @cover_state = 'good'
    @label = label
    label.items << self unless label.items.include?(self)
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
