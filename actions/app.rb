require './classes/album'
require 'date'
require './classes/genre'
require './classes/book'
require './classes/label'
require './modules/book_module'
require 'fileutils'

class App
  attr_accessor :books, :labels

  def initialize
    @music_albums = []
    @genres = []
    @books = []
    @labels = []
    load_data_from_json
  end

  def list_all_music_albums
    @music_albums.each do |album|
      puts "Genre: #{album.genre.name}, Author: #{album.author},
      Publish Date: #{album.publish_date}, Label: #{album.label},On Spotify: #{album.on_spotify}"
    end
  end

  def list_all_genres
    @genres.each do |genre|
      puts "Name: #{genre.name}"
    end
  end

  def add_music_album
    puts 'Who is the author of this album?'
    author = gets.chomp
    puts 'Is this album on spotify?'
    response = gets.chomp
    on_spotify = response.capitalize == 'Y'
    puts 'What is the genre of this album?'
    response = gets.chomp
    genre = Genre.new(response)
    @genres.push(genre) unless @genres.include?(genre) == true
    publish_date = DateTime.now
    puts 'What is the source of the album?'
    source = gets.chomp
    new_album = MusicAlbum.new(on_spotify, genre, author, source, publish_date)
    @music_albums << new_album
    puts 'Music album created successfully'
  end

  def list_all_books
    if @books.empty?
      puts 'There are No books available'
    else
      puts 'Lists of Books:'
      @books.each do |book|
        puts "Publisher: #{book.publisher}, Cover_State: #{book.cover_state},
        Genre: #{book.genre}, Author: #{book.publisher}, Source: #{book.source},
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
    book = Book.new(publisher, cover_state, genre, author, source, publish_date, label)
    @books << book
    puts 'Book created successfully'
  end

  def save_data_to_json
    FileUtils.mkdir_p(DATA_DIR)

    save_label_to_json
    save_book_to_json
  end
end
