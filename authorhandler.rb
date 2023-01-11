require_relative 'author'

module AuthorHandler
  def author_handler(game)
    puts 'Would you like to add an author to this item? (Y/N)'
    answer = gets.chomp
    unless answer.downcase == 'n'
      puts 'Select an existing author by index or create a new one(0): '
      list_authors
      response = gets.chomp.to_i
      if response.zero?
        newauthor = create_author
        game.add_author(newauthor)
      else
        game.add_author(@authorlist[response - 1])
      end
    end
    puts 'Gamme added successfully'
  end
end
