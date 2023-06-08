require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, genre, author, source, date, label)
    super(genre, author, source, date, label)
    @publisher = publisher
    @cover_state = 'good'
  end

  private
  
  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
