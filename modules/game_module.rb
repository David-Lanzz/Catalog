require_relative '../classes/game'
require 'json'
require 'date'
require 'fileutils'

module GameModule
  def load_game
    file = 'games.json'
    data = []
    if File.exist?(file) && !File.empty?(file)
      JSON.parse(File.read(file)).each do |element|
        data << Game.new(element['publish_date'], element['multiplayer'], element['last_played_at'])
      end
    end
    data
  end

  def save_game
    data = []
    directory = './json_db'
    file_path = './json_db/games.json'

    begin
      # Create the directory if it doesn't exist
      FileUtils.mkdir_p(directory)

      # Process the games and prepare the data
      @games.each do |game|
        data.push({
                    'publish_date' => game.publish_date,
                    'multiplayer' => game.multiplayer,
                    'last_played_at' => game.last_played_at
                  })
      end

      # Write the data to the file atomically
      File.open(file_path, 'w') do |file|
        file.puts(JSON.pretty_generate(data))
      end

      puts 'Game data saved successfully.'
    rescue StandardError => e
      puts "Error occurred while saving the game data: #{e.message}"
      puts e.backtrace
    end
  end
end
