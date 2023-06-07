class Choices
  def initialize(choice, app)
    @choice = choice
    case @choice
    when 1
      app.list_all_books
    when 10
      app.add_music_album
    when 2
      app.list_all_music_albums
    when 5
      app.list_all_genres
    when 6
      app.list_all_labels
    when 13
      puts 'Thank You for using this app!'
      exit 0
    end
  end
end
