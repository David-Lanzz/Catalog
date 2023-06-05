require_relative 'options'
require_relative 'choices'
class Main
  def options; end

  def run
    loop do
      Options.new
      Choices.new
    end
  end
end
