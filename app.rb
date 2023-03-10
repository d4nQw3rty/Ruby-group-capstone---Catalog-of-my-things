require_relative 'book'
require_relative 'game'
require_relative 'author'
require_relative 'label'
require_relative 'musicalbum'
require_relative 'genre'
require_relative 'genresdata'
require_relative 'booksdata'
require_relative 'labelhandler'
require_relative 'labelsdata'
require_relative 'genrehandler'
require_relative 'musicdata'
require_relative 'gamesdata'
require_relative 'authordata'
require_relative 'authorhandler'

# rubocop:disable Metrics/ClassLength
class App
  def initialize
    @booklist = []
    @labellist = []
    @musiclist = []
    @genrelist = []
    @authorlist = []
    @gamelist = []
  end

  include BooksData
  include LabelHandler
  include LabelsData
  include GenreHandler
  include GenresData
  include MusicData
  include AuthorHandler
  include AuthorsData
  include GamesData

  def load_data
    load_genres
    load_labels
    load_authors
    load_books
    load_musicalbums
    load_games
  end

  def save_data
    save_books
    save_labels
    save_music
    save_genres
    save_authors
    save_games
  end

  def add_objects(option)
    case option
    when '6'
      add_book
    when '7'
      add_musicalbum
    when '8'
      add_game
    end
  end

  def list_objects(option)
    case option
    when '0'
      list_books
    when '1'
      list_musicalbums
    when '2'
      list_games
    when '3'
      list_genres
    when '4'
      list_labels
    when '5'
      list_authors
    end
  end

  def list_books
    @booklist.each_with_index do |book, index|
      label = book.label.title || 'None'
      firstname = book.author.first_name || 'Unknown'
      lastname = book.author.last_name || ''
      puts "#{index}) Title: \"#{book.name}\", Author: #{firstname} #{lastname}, Label: #{label}, " \
           "Published: #{book.published_date}, Publisher: #{book.publisher}, " \
           "State of the cover: #{book.cover_state.capitalize}"
    end
  end

  def list_labels
    @labellist.each_with_index do |label, index|
      puts "#{index + 1}) Title: \"#{label.title}\", Color: #{label.color}, Items: #{label.items.length}"
    end
  end

  def list_musicalbums
    @musiclist.each_with_index do |music, index|
      genre = if music.genre.nil?
                'none'
              else
                music.genre.name
              end
      puts "#{index}) Name: \"#{music.name}\", Genre: #{genre}," \
           "Publish Date: #{music.published_date}, Archived: #{music.archived}"
    end
  end

  def list_genres
    @genrelist.each_with_index do |genre, index|
      puts "#{index + 1}) Name: \"#{genre.name}\", Items: #{genre.items.length}"
    end
  end

  def create_genre
    puts 'Insert Label Name: '
    name = gets.chomp
    genre = Genre.new(name)
    @genrelist.push(genre)
    genre
  end

  def list_games
    @gamelist.each_with_index do |game, index|
      label = game.label.title || 'None'
      firstname = game.author.first_name || 'Unknown'
      lastname = game.author.last_name || ''
      multiplayer = game.multiplayer ? 'Yes' : 'No'
      puts "#{index + 1}) Title: \"#{game.name}, Author: #{firstname} #{lastname}, " \
           "Label: #{label}, Published: #{game.published_date}, " \
           "Multiplayer: #{multiplayer}, Last Played: #{game.last_played_date}"
    end
  end

  def list_authors
    @authorlist.each_with_index do |author, index|
      puts "#{index + 1}) Name: #{author.first_name} #{author.last_name}, Items: #{author.items.length}"
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
    cover = if state == '1'
              'good'
            else
              'bad'
            end
    newbook = Book.new(title, publisher, cover, published_date)
    @booklist.push(newbook)
    author_handler(newbook)
    label_handler(newbook)
    genre_handler(newbook)
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
    multiplayer = multiplayer == '1'
    print 'Game last played date: '
    last_played_date = gets.chomp
    newgame = Game.new(name, published_date, multiplayer, last_played_date)
    @gamelist.push(newgame)
    author_handler(newgame)
    label_handler(newgame)
    genre_handler(newgame)
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

  def add_musicalbum
    print 'Name:'
    name = gets.chomp
    print 'Publish date(YYYY-MM-DD):'
    published_date = gets.chomp
    print 'Is it on sportify: (Y/N)'
    on_spotify = gets.chomp
    on_spotify = on_spotify.downcase == 'y'
    newsong = MusicAlbum.new(name, published_date, on_spotify: on_spotify)
    @musiclist.push(newsong)
    author_handler(newsong)
    label_handler(newsong)
    genre_handler(newsong)
    puts 'Music Album added successfully'
  end
end
# rubocop:enable Metrics/ClassLength
