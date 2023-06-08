require 'json'

class Storage
  def store_album(albums)
    album_arr = []
    albums.each do |album|
      album_arr << {
        genre: album.genre.name,
        author: album.author,
        publish_date: album.publish_date,
        label: album.label,
        on_spotify: album.on_spotify,
        source: album.source
      }
    end
    File.write('album.json', JSON.generate(album_arr))
  end

  def store_genre(genres)
    genre_arr = []
    genres.each do |genre|
      genre_arr << {
        id: genre.id,
        name: genre.name,
        items: genre.items
      }
    end
    File.write('genre.json', JSON.generate(genre_arr))
  end
end
