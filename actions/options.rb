class Options
  def initialize
    options = [
      '1) List all books',
      '2) List all music albums',
      '3) List all movies',
      '4) List of games',
      '5) List all genres (e.g "Comedy", "Thriller")',
      '6) List all labels',
      '7) List all authors',
      '8) List all sources',
      '9) Add a book',
      '10) Add a music album',
      '11) Add a movie',
      '12) Add a game',
      '13) Exit'
    ]
    options.each do |option|
      puts option
    end
  end
end
