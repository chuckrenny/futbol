require 'csv'

module DataParsable
  attr_reader :games, :teams, :game_teams

  def initialize(files)
    @games = parse_data(files[:games], Game)
    @teams = parse_data(files[:teams], Team)
    @game_teams = parse_data(files[:game_teams], GameTeam)
  end

  def parse_data(files, object)
    (CSV.foreach(files, headers: true, header_converters: :symbol)).map do |row|
      object.new(row)
    end
  end
end