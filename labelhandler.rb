require_relative 'label'

module LabelHandler
  def label_handler(item)
    puts 'Would you like to give this item a label? (Y/N)'
    answer = gets.chomp
    unless answer.downcase == 'n'
      puts 'Select an existing label by index or create a new one(0): '
      list_labels
      response = gets.chomp.to_i
      if response.zero?
        newlabel = create_label
        item.add_label(newlabel)
      else
        item.add_label(@labellist[response - 1])
      end
    end
    puts 'Label added successfully'
  end
end
