require_relative 'book'
require_relative 'label'

class App
  def initialize
    @booklist = []
    @labellist = []
  end

  def list_books
    @booklist.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.name}\", Author: {book.author}"
    end
  end

  def list_labels
    @labellist.each do |label|
      puts "Title: \"#{label.title}\", Color: #{label.color}"
    end
  end

  def add_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    print 'Genre: '
    genre = gets.chomp
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
    puts 'Book added successfully'
  end

  def add_label(title, color)
    label = Label.new(title, color)
    @labellist.push(label)
  end
end
