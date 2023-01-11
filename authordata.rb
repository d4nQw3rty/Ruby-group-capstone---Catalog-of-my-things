require 'json'
require_relative 'author'

module AuthorsData
  def write_json(array, file_path)
    File.write(file_path, JSON.pretty_generate(array))
  end

  def read_json(file_path)
    return [] unless File.exist?(file_path)

    file = File.read(file_path)
    JSON.parse(file)
  end

  def save_authors
    array = read_json('./JSON_data/authors.json')
    list_id = []
    array.each { |author| list_id.push(author['id']) }
    @authorlist.each do |author|
      next if list_id.include?(author.id)

      array.push(
        {
          first_name: author.first_name,
          last_name: author.last_name,
          id: author.id
        }
      )
    end
    write_json(array, './JSON_data/authors.json')
  end

  def load_authors
    parse_file = read_json('./JSON_data/authors.json')
    parse_file.each do |author|
      @authorlist.push(Author.new(author['first_name'], author['last_name'], id: author['id']))
    end
  end
end