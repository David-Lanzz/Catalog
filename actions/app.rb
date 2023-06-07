require './classes/album'
require 'date'
require './classes/genre'
require './classes/book'

class App
  attr_accessor :books, :labels

  def initialize
    @music_albums = []
    @genres = []
    @books = []
    @labels = []
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
        puts "Cover_State: #{book.cover_state} Author: #{book.publisher}"
      end
    end
  end

  def list_all_labels
    if @labels.empty?
      puts 'There are No labels available'
    else
      puts 'Lists of Labels:'
      @labels.each do |label|
        puts "Name: #{label.name}"
      end
    end
  end

end
