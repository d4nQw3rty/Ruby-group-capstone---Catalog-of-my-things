require_relative 'app'

class Main
  def initialize
    @app = App.new
    @welcome = 'Welcome to the Catalogue App!'
  end

  def interface
    puts @welcome
    puts ''
    puts 'Please choose and option by entering a number: '
    puts '0 - List all books'
    puts '1 - List all music albums'
    puts '2 - List of games'
    puts '3 - List all genres'
    puts '4 - List all labels'
    puts '5 - List all authors'
    puts '6 - Add a book'
    puts '7 - Add a music album'
    puts '8 - Add a game'
    puts '9 - Exit'
    puts ''
    @welcome = ''
  end

  def select
    option = gets.chomp
    puts ''
    case option
    when '0', '1', '2', '3', '4', '5'
      @app.list_objects(option)
      run
    when '6', '7', '8'
      @app.add_objects(option)
      run
    when '9'
      @app.save_data
      puts 'Thank you for using this App!'
    else
      puts 'Incorrect Input: Option does not exist'
      run
    end
  end

  def start
    @app.load_data
    run
  end

  def run
    interface
    select
  end

  private :select
end

Main.new.start
