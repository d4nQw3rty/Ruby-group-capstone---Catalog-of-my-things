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
    when '0'
      @app.list_books
      run
    when '4'
      @app.add_label('TestLabel', 'blue')
      @app.list_labels
      run
    when '6'
      @app.add_book
      run
    when '9'
      puts 'Thank you for using this App!'
    else
      puts 'Incorrect Input: Option does not exist'
      run
    end
  end

  def start
    run
  end

  def run
    interface
    select
  end

  private :select
end

Main.new.start
