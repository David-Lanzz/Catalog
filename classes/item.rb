class Item
  attr_accessor :genre, :author, :source, :label, :publish_date, :archived

  def initialize(genre, author, source, label, date)
    @id = Random.rand
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = date
    @archived = false
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end

  private

  def can_be_archived?
    return true if @publish_date > 10

    false
  end
end
