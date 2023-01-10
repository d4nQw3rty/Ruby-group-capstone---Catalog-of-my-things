require_relative 'label'

module LabelHandler
  def label_handler(book)
    puts 'Would you like to give this book a label? (Y/N)'
    answer = gets.chomp
    unless answer.downcase == 'n'
      puts 'Select an existing label by index or create a new one(0): '
      list_labels
      response = gets.chomp.to_i
      if response.zero?
        newlabel = create_label
        book.add_label(newlabel)
      else
        book.add_label(@labellist[response - 1])
      end
    end
    puts 'Book added successfully'
  end
end
