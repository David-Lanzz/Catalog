require_relative 'options'
require_relative 'choices'
require_relative 'app'
require './retrieval/retriever'

class Main
  def initialize
    retrieved = Retrieve.new
    @app = App.new(retrieved.get_albums, retrieved.get_genres)
  end

  def run
    loop do
      Options.new
      choice = gets.chomp.to_i
      Choices.new(choice, @app)
    end
  end
end

main = Main.new
main.run
