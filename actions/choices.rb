class Choices
  def initialize(choice, app)
    @choice = choice
    case @choice
    when 10
      app.add_music_album
    when 2
      app.list_all_music_albums
    when 4
      app.list_all_games
    when 5
      app.list_all_genres
    when 12
      app.add_game
    when 13
      app.exit_app
    else
      puts 'Invalid option'
    end
  end
end
