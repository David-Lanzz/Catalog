require_relative '../classes/author'
require 'json'
require 'date'

module AuthorModule
  def create_author(items)
    puts 'Enter author first name:'
    first_name = gets.chomp
    puts 'Enter author last name:'
    last_name = gets.chomp
    author = Author.new(first_name, last_name, @authors.length + 1)
    author.add_item(items)
    @authors << author
    save_author
  end

  def load_author
    file = 'authors.json'
    data = []
    if File.exist?(file) && !File.empty?(file)
      JSON.parse(File.read(file)).each do |author|
        data << Author.new(author['first_name'], author['last_name'], author['id'])
      end
    end
    data
  end

  def save_author
    data = []
    directory = './json_db'
    file_path = './json_db/authors.json'
    begin
      # Create the directory if it doesn't exist
      FileUtils.mkdir_p(directory)

      @authors.each do |author|
        data << { id: author.id, first_name: author.first_name, last_name: author.last_name }
      end

      File.open(file_path, 'w') do |file|
        file.puts(JSON.pretty_generate(data))
      end
      puts 'author data saved successfully.'
    rescue StandardError => e
      puts "Error occurred while saving the game data: #{e.message}"
      puts e.backtrace
    end
  end
end
