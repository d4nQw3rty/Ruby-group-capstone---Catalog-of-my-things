require 'json'
require_relative 'label'

module LabelsData
  def write_json(array, file_path)
    File.write(file_path, JSON.pretty_generate(array))
  end

  def read_json(file_path)
    return [] unless File.exist?(file_path)

    file = File.read(file_path)
    JSON.parse(file)
  end

  def save_labels
    array = read_json('./JSON_data/labels.json')
    list_id = []
    array.each { |label| list_id.push(label['id']) }
    @labellist.each do |label|
      next if list_id.include?(label.id)

      array.push(
        {
          title: label.title,
          color: label.color,
          id: label.id
        }
      )
    end
    write_json(array, './JSON_data/labels.json')
  end

  def load_labels
    parse_file = read_json('./JSON_data/labels.json')
    parse_file.each do |label|
      @labellist.push(Label.new(label['title'], label['color'], id: label['id']))
    end
  end
end
