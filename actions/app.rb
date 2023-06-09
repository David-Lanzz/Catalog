require 'date'
require './classes/book'
require './classes/label'
require './modules/book_module'
require 'fileutils'

class App
  attr_accessor :books, :labels

  def initialize
    @books = []
    @labels = []
    load_data_from_json
  end

  def list_all_books
    if @books.empty?
      puts 'There are No books available'
    else
      puts 'Lists of Books:'
      @books.each do |book|
        puts "Publisher: #{book.publisher}, Cover_State: #{book.cover_state},
        Publish Date: #{book.publish_date}, Label Title: #{book.label.title}, Label Color: #{book.label.color}"
      end
    end
  end

  def list_all_labels
    if @labels.empty?
      puts 'There are No labels available'
    else
      puts 'Lists of Labels:'
      @labels.each do |label|
        puts "Title: #{label.title}, Color: #{label.color}"
      end
    end
  end

  def add_book
    puts 'Enter Publisher of the book:'
    publisher = gets.chomp
    puts 'Enter Cover State of the book:'
    cover_state = gets.chomp
    puts 'Enter Publish Date of the book:'
    publish_date = gets.chomp
    puts 'Enter Label Title of the book:'
    title = gets.chomp
    puts 'Enter Color of the label:'
    color = gets.chomp
    label = Label.new(title, color)
    @labels << label
    book = Book.new(publisher, cover_state, publish_date, label)
    @books << book
    puts 'Book created successfully'
  end

  def save_data_to_json
    FileUtils.mkdir_p(DATA_DIR)

    save_label_to_json
    save_book_to_json
  end
end
