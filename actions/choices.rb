class Choices
  def initialize(choice, app)
    @choice = choice
    case @choice
    when 10
      app.add_music_album
    when 2
      app.list_all_music_albums
    when 5
      app.list_all_genres
    when 13
      puts 'Thankyou for using this catalog application, Hope to see you again soon'
      exit
    end
  end
end
