require_relative 'app'
require_relative '../modules/book_module'

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
    when 7
      app.list_all_authors
    when 12
      app.add_game
    when 1
      app.list_all_books
    when 9
      app.add_book
    when 6
      app.list_all_labels
    when 8
      app.list_all_sources
    when 13
      puts 'Data saved successfully'
      puts 'Thank You for using this app!'
      exit
    else
      puts 'Invalid option'
    end
  end
end
