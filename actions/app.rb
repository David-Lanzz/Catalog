require 'date'
require './storage/storage'
require './classes/genre'
require './classes/game'
require './modules/game_module'
require './modules/author_module'
require './classes/book'
require './classes/label'
require './modules/book_module'
require 'fileutils'
require './classes/album'
require "./classes/source.rb"

class App
  include GameModule
  include AuthorModule
  attr_accessor :books, :labels

  def initialize(music_albums, genres,sources)
    @music_albums = music_albums
    @genres = genres
    @games = load_game
    @authors = load_author
    @sources = sources
    @books = []
    @labels = []
    load_data_from_json
  end

  def list_all_music_albums
    @music_albums.each do |album|
      puts "Genre: #{album[:genre]}, Author: #{album[:author]},Publish Date: #{album[:publish_date]},
       Label: #{album[:label]},On Spotify: #{album[:on_spotify]}"
    end
  end

  def list_all_genres
    @genres.each do |genre|
      puts "Name: #{genre[:name]}"
    end
  end

  def list_all_sources
    @sources.each do |source|
      puts "Name: #{source[:name]}"
    end
  end

  def add_music_album
    puts 'Who is the author of this album?'
    author = gets.chomp
    puts 'Is this album on spotify?(yes or no)'
    response = gets.chomp
    on_spotify = response.upcase == 'YES'
    puts 'What is the genre of this album?'
    response = gets.chomp
    genre = Genre.new(response)
    puts 'What is the publish date of this project?'
    publish_date = gets.chomp
    puts 'What label is this album in?'
    label = gets.chomp
    puts 'Who wrote this album?'
    response = gets.chomp
    source = Source.new(response)
    new_album = MusicAlbum.new(on_spotify, genre, author, label, publish_date, source)
    puts new_album.source
    new_album.genre.items << { genre: new_album.genre.name, author: new_album.author,
                               publish_date: new_album.publish_date,
                               label: new_album.label, on_spotify: new_album.on_spotify, source: new_album.source }
    @music_albums << { genre: new_album.genre.name, author: new_album.author, publish_date: new_album.publish_date,
                       label: new_album.label, on_spotify: new_album.on_spotify, source: new_album.source.name }
                       @sources << {
                        name: new_album.source.name
                       }
    continue_addition_of_music_album(@music_albums, @genres, genre,@sources)
  end

  def continue_addition_of_music_album(music_albums, genres, genre,sources)
    genres << { name: genre.name, id: genre.id } unless @genres.include?({ name: genre.name, id: genre.id }) == true
    Storage.new.store_album(music_albums)
    Storage.new.store_genre(genres)
    Storage.new.store_sources(sources)
    puts 'Music album created successfully'
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

  def list_all_authors
    if @authors.empty?
      puts 'There are no authors in the library'
      return
    end
    @authors.each do |author|
      puts "ID: #{author.id}"
      puts "First name: #{author.first_name}"
      puts "Last name: #{author.last_name}"
    end
  end

  def list_all_games
    if @games.empty?
      puts 'there is no games in the list'
      nil
    else
      @games.each do |game|
        puts "publish date : #{game.publish_date}"
        puts "Multiplayer : #{game.multiplayer}"
        puts "last played at : #{game.last_played_at}"
      end
    end
  end

  def add_game
    puts 'Please add the publish date of the game : YYYY-MM-DD'
    publish_date = gets.chomp
    puts 'Is it multiplayer? true/false'
    multiplayer = gets.chomp
    if multiplayer != 'true' && multiplayer != 'false'
      puts 'you entered invalid option. please enter true or false'
      return
    end
    puts 'when was this game last played at? enter YYYY-MM-DD'
    last_played_at = gets.chomp
    game = Game.new(publish_date, multiplayer, last_played_at)
    @games.push(game)
    create_author(game)
    save_game
    puts 'Game created successfully'
  end

  def exit_app
    puts 'Thank you for using the app, Hope to see you soon'
    exit
  end
end
