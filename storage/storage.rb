require 'json'
require 'fileutils'

class Storage
  def initialize
    FileUtils.mkdir_p('./json_db')
  end

  def store_album(albums)
    album_arr = []
    albums.each do |album|
      album_arr << {
        genre: album[:genre],
        author: album[:author],
        publish_date: album[:publish_date],
        label: album[:label],
        on_spotify: album[:on_spotify],
        source: album[:source]
      }
    end
    File.write('./json_db/album.json', JSON.generate(album_arr))
  end

  def store_genre(genres)
    genre_arr = []
    genres.each do |genre|
      genre_arr << {
        name: genre[:name]
      }
    end
    File.write('./json_db/genre.json', JSON.generate(genre_arr))
  end
end
