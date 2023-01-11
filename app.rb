require_relative 'book'
require_relative 'label'
require_relative 'musicalbum'
require_relative 'genre'
require_relative 'genresdata'
require_relative 'booksdata'
require_relative 'labelhandler'
require_relative 'labelsdata'
require_relative 'genrehandler'
require_relative 'musicdata'

class App
  def initialize
    @booklist = []
    @labellist = []
    @musiclist = []
    @genrelist = []
  end

  include BooksData
  include LabelHandler
  include LabelsData
  include GenreHandler
  include GenresData
  include MusicData

  def load_data
    load_labels
    load_books
    load_musicalbums
    load_genres
  end

  def save_data
    save_books
    save_labels
    save_music
    save_genres
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

  def list_musicalbums
    @musiclist.each_with_index do |music, index|
      genre = if music.genre.nil?
                'none'
              else
                music.genre.name
              end
      puts "#{index}) Name: \"#{music.name}\", Genre: #{genre},"\
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
    label_handler(newbook)
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
    genre_handler(newsong)
  end
end
