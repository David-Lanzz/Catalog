require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(genre, author, source, publish_date, on_spotify = true)
    super(genre, author, publish_date, source)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    return true if super == true && @on_spotify == true


    false
  end
end
