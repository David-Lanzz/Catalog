class Options
  def initialize
    options = [
      '1) List all books',
      '2) List all music albums',
      # '3) List all movies',
      '3) List of games',
      '4) List all genres (e.g "Comedy", "Thriller")',
      '5) List all labels',
      '6) List all authors',
      # '7) List all sources',
      '7) Add a book',
      '8) Add a music album',
      # '10) Add a movie',
      '9) Add a game',
      '10) Exit'
    ]
    options.each do |option, _index|
      puts option
    end
  end
end
