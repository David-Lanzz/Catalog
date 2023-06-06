class Options
  def initialize
    options = [
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
      'Add a game'
    ]
    options.each do |option|
      puts option
    end
  end
end
