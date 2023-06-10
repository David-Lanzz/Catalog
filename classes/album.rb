require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify = true, genre, author, label, publish_date, source)
    super(publish_date)
    @genre = genre
    @author = author
    @label = label
    @source = source
    @on_spotify = on_spotify
  end

  def can_be_archived?
    return true if super == true && @on_spotify == true

    false
  end
end
