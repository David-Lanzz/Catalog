require 'json'

class Retrieve
  def get_albums
    @album_arr = []
    if File.exist?('album.json')
      File.open('album.json', 'r') do |file|
        new_file = JSON.parse(file.read)
        new_file.each do |info|
          @album_arr << {
            genre: info['genre'],
            author: info['author'],
            publish_date: info['publish_date'],
            label: info['label'],
            on_spotify: info['on_spotify'],
            source: info['source']
          }
        end
      end
    else
      @album_arr = []
    end
    @album_arr
  end

  def get_genres
    @genre_arr = []
    if File.exist?('genre.json')
      File.open('genre.json', 'r') do |file|
        new_file = JSON.parse(file.read)
        new_file.each do |info|
          @genre_arr << {
            name: info['name']
          }
        end
      end
    else
      @genre_arr = []
    end
    @genre_arr
  end
end
