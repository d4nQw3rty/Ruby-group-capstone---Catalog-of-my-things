require_relative 'book'
require_relative 'label'
require_relative 'booksdata'
require_relative 'labelhandler'
require_relative 'labelsdata'
require_relative 'game'
require_relative 'author'
require_relative 'authorhandler'
require_relative 'authordata'
require_relative 'gamesdata'

class App
  def initialize
    @booklist = []
    @labellist = []
    @authorlist = []
    @gamelist = []
  end

  include BooksData
  include LabelHandler
  include LabelsData
  include AuthorHandler 
  include AuthorsData
  include GamesData  

  def load_data
    load_labels
    load_books
    load_authors
    load_games    
  end

  def save_data
    save_books
    save_labels
    save_authors
    save_games
  end

  def list_books
    @booklist.each_with_index do |book, index|
      label = if book.label.nil?
                'none'
              else
                book.label.title
              end
      # rubocop:disable Layout/LineLength
      puts "#{index}) Title: \"#{book.name}\", Label: #{label}, Publisher: #{book.publisher}, Date of Publication: #{book.published_date}, State of the cover: #{book.cover_state}, Archived: #{book.archived}"
      # rubocop:enable Layout/LineLength
    end
  end

  def list_labels
    @labellist.each_with_index do |label, index|
      puts "#{index + 1}) Title: \"#{label.title}\", Color: #{label.color}, Items: #{label.items.length}"
    end
  end

  def list_games
    @gamelist.each_with_index do |game, index|
      puts "#{index + 1}) Title: \"#{game.name}\", Published: #{game.published_date}, " \
           "Multiplayer: #{game.multiplayer}, Last Date: #{game.last_played_date}"
    end
  end

  def list_authors
    @authorlist.each_with_index do |author, index|
      puts "#{index + 1}) First Name: \"#{author.first_name}\", Last Mame: #{author.last_name}, Items: #{author.items.length}"
    end
  end

  def add_book
    print 'Title: '
    title = gets.chomp
    print 'Publisher: '
    publisher = gets.chomp
    print 'Published date(YYYY-MM-DD): '
    published_date = gets.chomp
    print 'What is the state of the cover? Answer with 1(good) or 2(bad)? '
    state = gets.chomp
    case state
    when '1'
      cover = 'good'
    when '2'
      cover = 'bad'
    else
      puts 'Incorrect Input: Option does not exist'
    end
    newbook = Book.new(title, publisher, cover, published_date)
    @booklist.push(newbook)
    author_handler(newbook)
    label_handler(newbook)
    puts 'Book added successfully'
  end

  def create_label
    puts 'Insert Label Title: '
    title = gets.chomp
    puts 'Insert Label Color: '
    color = gets.chomp
    label = Label.new(title, color)
    @labellist.push(label)
    label
  end 

  def add_game
    print 'Game Title: '
    name = gets.chomp
    print 'Game Published Date: '
    published_date = gets.chomp
    print 'is a multiplayer game? Answer with 1(yes) or 2(no)? '
    multiplayer = gets.chomp
    case multiplayer
    when '1'
      multiplayer = true
    when '2'
      multiplayer = false
    else
      puts 'Incorrect Input: Option does not exist'
    end
    print 'Game last played date: '
    last_played_date = gets.chomp

    newgame = Game.new(name, published_date, multiplayer, last_played_date)
    @gamelist.push(newgame)
    author_handler(newgame)
    label_handler(newgame)
    puts 'Game added successfully'
  end

  def create_author
    puts 'Insert Author First Name: '
    first_name = gets.chomp
    puts 'Insert Author Last Name: '
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    @authorlist.push(author)
    author    
  end  
end
