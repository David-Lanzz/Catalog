require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

<<<<<<< HEAD
  def initialize(on_spotify = true, genre, author, label, publish_date, source)
    super(genre, author, publish_date, label, source)
=======

  def initialize(on_spotify = true, genre, author, label, publish_date,source)
    super(genre, author, publish_date, label,source)

>>>>>>> c6a73f101bf61a28b4b1ec1a63a864263548e4fb
    @on_spotify = on_spotify
  end

  def can_be_archived?
    return true if super == true && @on_spotify == true

    false
  end
end
