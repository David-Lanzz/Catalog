class Item
  attr_accessor :genre, :author, :source, :publish_date, :archived
  attr_reader :label

  def initialize(_publish_date, label)
    @id = Random.rand(1..1000)
    @genre = genre
    @author = author
    @source = source
    @publish_date = date
    @archived = false
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end

  def label=(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  private

  def can_be_archived?
    return true if @publish_date > 10

    false
  end
end
