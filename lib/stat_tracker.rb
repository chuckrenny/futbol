# require 'csv'
require_relative 'team'
require_relative 'game'
require_relative "game_team"
require_relative 'game_statable'
require_relative 'league_statable'
require_relative 'season_statable'
require_relative 'data_parsable'

class StatTracker
include DataParsable
include GameStatable
include LeagueStatable
include SeasonStatable

  def team_info(team_id)
    @teams.each_with_object({}) do |team, hash|
      if team.team_id == team_id
        hash[:team_id] = team_id
        hash[:franchise_id] = team.franchise_id
        hash[:team_name] = team.team_name
        hash[:abbreviation] = team.abbreviation
        hash[:link] = team.link
      end
    end
  end

  def biggest_team_blowout(team_id)
    # biggest difference between team and opponent goals for a win for the given team
    # Use @game_teams.csv
    # 1. Iterate
  end

  def games_won_per_team
    @game_teams.each_with_object(Hash.new(0.0)) do |game, games_won|
      games_won[game.team_id] += 1 if game. result == "WIN"
    end
  end

  def percentage_games_won_by_team_id
    games_won_per_team.each_with_object(Hash.new(0.0)) do |(key, value), hash|
      hash[key] = (value / games_played_per_team[key]).round(2)
    end
  end

  def average_win_percentage(team_id)
    percentage_games_won_by_team_id[team_id]
  end

  def self.from_csv(files)
    StatTracker.new(files)
  end
end