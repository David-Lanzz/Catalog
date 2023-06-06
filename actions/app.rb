require './classes/album'
require 'date'
require './classes/genre'

class App
  def initialize
    @music_albums = []
    @genres = []
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
end
