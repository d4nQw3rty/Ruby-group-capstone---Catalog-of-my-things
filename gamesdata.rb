require 'json'
require_relative 'game'

module GamesData
  def write_json(array, file_path)
    File.write(file_path, JSON.pretty_generate(array))
  end

  def read_json(file_path)
    return [] unless File.exist?(file_path)

    file = File.read(file_path)
    JSON.parse(file)
  end

  def save_games
    array = read_json('./JSON_data/games.json')
    list_id = []
    array.each { |game| list_id.push(game['id']) }
    @gamelist.each do |game|
      next if list_id.include?(game.id)
      label = game.label.id || nil
      author = game.author.id || nil
      array.push({ name:game.name, published_date: game.published_date, last_played_date: game.last_played_date,
          author: author, label: label, id: game.id, archived: game.archived })
    end
    write_json(array, './JSON_data/games.json')
  end

  def load_games
    parse_file = read_json('./JSON_data/games.json')
    parse_file.each do |game|
      correctauthor = @authorlist.find { |author| author.id == game['author'] }
      correctlabel = @labellist.find { |label| label.id == game['label'] }
      loadedgame =Game.new(game['name'], game['published_date'], game['last_played_date'],
                            id: game['id'], archived: game['archived'])
      @gamelist.push(loadedgame)
      loadedgame.add_author(correctauthor)
      loadedgame.add_label(correctlabel)
    end
  end
end