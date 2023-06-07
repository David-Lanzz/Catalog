require_relative 'options'
require_relative 'choices'
require_relative 'app'

class Main
  def initialize
    @app = App.new
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
