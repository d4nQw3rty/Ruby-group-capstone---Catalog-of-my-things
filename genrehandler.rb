require_relative 'genre'

module GenreHandler
  def genre_handler(item)
    puts 'Would you like to give the item a genre? (Y/N)'
    answer = gets.chomp
    unless answer.downcase == 'n'
      puts 'Select an existing genre by index or create a new one(0):'
      list_genres
      response = gets.chomp.to_i
      if response.zero?
        newgenre = create_genre
        item.add_genre(newgenre)
      else
        item.add_genre(@genrelist[response - 1])
      end
    end
    puts 'Genre added successfully'
  end
end
