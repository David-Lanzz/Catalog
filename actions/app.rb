require '../classes/album'
require 'date'
require '../classes/genre'
require '../classes/game'
require '../modules/game_module'

class App
  include GameModule

  def initialize
    @music_albums = []
    @genres = []
    @games = load_game
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
    save_game
    puts 'Game created successfully'
  end

  def exit_app
    puts 'Thank you for using the app'
    exit
  end
end
