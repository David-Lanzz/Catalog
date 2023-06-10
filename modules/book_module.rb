require 'json'

DATA_DIR = './json_db'.freeze

def save_label_to_json
  label_data = @labels.map do |label|
    {
      title: label.title,
      color: label.color
    }
  end
  File.write("#{DATA_DIR}/labels.json", JSON.generate(label_data))
end

def save_book_to_json
  book_data = @books.map do |book|
    {
      publisher: book.publisher,
      cover_state: book.cover_state,
      publish_date: book.publish_date,
      label_title: book.label.title,
      label_color: book.label.color
    }
  end

  File.write("#{DATA_DIR}/books.json", JSON.generate(book_data))
end

def load_books_from_json
  return unless File.exist?("#{DATA_DIR}/books.json")

  books = JSON.parse(File.read("#{DATA_DIR}/books.json"))
  books.each do |book|
    label = Label.new(book['label_title'], book['label_color'])
    @books << Book.new(book['publisher'], book['cover_state'], book['publish_date'], label)
  end
end

def load_labels_from_json
  return unless File.exist?("#{DATA_DIR}/labels.json")

  labels = JSON.parse(File.read("#{DATA_DIR}/labels.json"))
  labels.each do |label|
    @labels << Label.new(label['title'], label['color'])
  end
end

def load_data_from_json
  load_labels_from_json
  load_books_from_json

  puts 'Data loaded successfully'
end
