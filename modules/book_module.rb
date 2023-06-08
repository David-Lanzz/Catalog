require 'json'

DATA_DIR = 'data'.freeze

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
            genre: book.genre,
            author: book.author,
            source: book.source,
            publish_date: book.publish_date,
            label_title: book.label.title,
            label_color: book.label.color
        }
    end
    
    File.write("#{DATA_DIR}/books.json", JSON.generate(book_data))
end