# require 'csv'
require_relative 'team'
require_relative 'game'
require_relative "game_team"
require_relative 'game_statable'
require_relative 'league_statable'
require_relative 'season_statable'
require_relative 'data_parsable'
require_relative 'team_statable'

class StatTracker
include DataParsable
include GameStatable
include LeagueStatable
include SeasonStatable
include TeamStatable

  def self.from_csv(files)
    StatTracker.new(files)
  end
end