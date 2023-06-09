require_relative 'app'
require_relative '../modules/book_module'

class Choices
  def initialize(choice, app)
    @choice = choice
    case @choice
    when 1
      app.list_all_books
    when 9
      app.add_book
    when 6
      app.list_all_labels
    when 13      
      puts 'Data saved successfully'
      puts 'Thank You for using this app!'
      exit 0
  else
    puts 'Invalid option'
  end
  end
end
