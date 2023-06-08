class Options
  def initialize
    @options = [
      'List all books',
      'List all music albums',
      'List all movies',
      'List of games',
      'List all genres (e.g "Comedy", "Thriller")',
      'List all labels',
      'List all authors',
      'List all sources',
      'Add a book',
      'Add a music album',
      'Add a movie',
      'Add a game',
      'exit the app'
    ]
    @options.each_with_index do |option, index|
      puts "#{index + 1}. #{option}"
    end
  end
end
