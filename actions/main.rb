require_relative 'options'
require_relative 'choices'
require_relative 'app'
require '../retrieval/retriever'

class Main
  def initialize
    retrieved = Retrieve.new
    @app = App.new(retrieved.get_albums, retrieved.get_genres)
  end

  def run
    puts '----------------------'
    puts 'Welcome to the app!'
    loop do
      puts '----------------------'
      puts 'Please choose an option: [1-13]'
      Options.new
      choice = gets.chomp.to_i
      Choices.new(choice, @app)
    end
  end
end

main = Main.new
main.run
