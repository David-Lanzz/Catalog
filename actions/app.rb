require './classes/album'
require 'date'
require './storage/storage'
require './classes/genre'

class App
  def initialize(music_albums, genres)
    @music_albums = music_albums
    @genres = genres
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

  def add_music_album
    puts 'Who is the author of this album?'
    author = gets.chomp
    puts 'Is this album on spotify?(yes or no)'
    response = gets.chomp
    on_spotify = response.upcase == 'YES'
    puts 'What is the genre of this album?'
    response = gets.chomp
    genre = Genre.new(response)
    publish_date = DateTime.now
    puts 'What label is this album in?'
    label = gets.chomp
    puts 'Who wrote this album?'
    source = gets.chomp
    new_album = MusicAlbum.new(on_spotify, genre, author, publish_date, label, source)
    new_album.genre.items << { genre: new_album.genre.name, author: new_album.author,
                               publish_date: new_album.publish_date,
                               label: new_album.label, on_spotify: new_album.on_spotify, source: new_album.source }
    @music_albums << { genre: new_album.genre.name, author: new_album.author, publish_date: new_album.publish_date,
                       label: new_album.label, on_spotify: new_album.on_spotify, source: new_album.source }
    continue_addition_of_music_album(@music_albums, @genres, genre)
  end

  def continue_addition_of_music_album(music_albums, genres, genre)
    genres << { name: genre.name, id: genre.id } unless @genres.include?({ name: genre.name, id: genre.id }) == true
    Storage.new.store_album(music_albums)
    Storage.new.store_genre(genres)
    puts 'Music album created successfully'
  end
end
