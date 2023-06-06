require_relative 'options'
require_relative 'choices'
require_relative 'app'

class Main
  def initialize
    @app = App.new
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
