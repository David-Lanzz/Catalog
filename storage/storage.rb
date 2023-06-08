require "json"

class Storage
  def store_album(albums)
    album_arr = []
   albums.each{|album|
    album_arr << {
        genre: album.genre.name,
        author: album.author,
        publish_date: album.publish_date,
        label: album.label,
        on_spotify: album.on_spotify,
        source: album.source
      }
    }
    File.open('album.json','w+'){|file|
    file.write(JSON.generate(album_arr))
    }
  end

  def store_genre(genres)
    genre_arr = []
    genres.each{|genre|
      genre_arr << {
        id: genre.id,
        name: genre.name,
        items: genre.items
      }
    }
    File.open('genre.json','w+'){|file|
      file.write(JSON.generate(genre_arr))
      }
  end
end
