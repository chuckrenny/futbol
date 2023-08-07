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
        hash["team_id"] = team_id
        hash["franchise_id"] = team.franchise_id
        hash["team_name"] = team.team_name
        hash["abbreviation"] = team.abbreviation
        hash["link"] = team.link
      end
    end
  end

  def all_game_id(team_id)
    @game_teams.each_with_object({}) do |game, hash|
      hash[game.game_id] = game.result if game.team_id == team_id
    end
  end

  def best_season(team_id)
    season_result_total = @games.each_with_object(Hash.new([0,0])) do |game, hash|
        if all_game_id(team_id)[game.game_id] == "WIN"
          hash[game.season] = [1 + hash[game.season][0], 1+ hash[game.season][1]]
        elsif all_game_id(team_id)[game.game_id]
          hash[game.season] = [hash[game.season][0], 1+ hash[game.season][1]]
        end
      end

    season_result_total_transformed = season_result_total.transform_values do |value|
        (value[0] / value[1].to_f).round(4)
    end

    season_result_total_transformed.key(season_result_total_transformed.values.max)
  end

  def worst_season(team_id)
    season_result_total = @games.each_with_object(Hash.new([0,0])) do |game, hash|
        if all_game_id(team_id)[game.game_id] != "WIN"
          hash[game.season] = [1 + hash[game.season][0], 1+ hash[game.season][1]]
        elsif all_game_id(team_id)[game.game_id]
          hash[game.season] = [hash[game.season][0], 1+ hash[game.season][1]]
        end
      end

    season_result_total_transformed = season_result_total.transform_values do |value|
        (value[0] / value[1].to_f).round(4)
    end

    season_result_total_transformed.key(season_result_total_transformed.values.max)
  end

  def all_game_id_win(team_id)
    @game_teams.map do |game|
      game.game_id if game.team_id == team_id && game.result == "WIN"
    end.compact 
  end 

  def all_game_id_loss(team_id)
    @game_teams.map do |game|
      game.game_id if game.team_id == team_id && game.result == "LOSS"
    end.compact 
  end

  def goals_win(team_id)
    @games.map do |game|
      (game.home_goals - game.away_goals).abs if all_game_id_win(team_id).include?(game.game_id)
    end
  end

  def goals_loss(team_id)
    @games.map do |game|
      (game.home_goals - game.away_goals).abs if all_game_id_loss(team_id).include?(game.game_id)
    end
  end

  def biggest_team_blowout(team_id)
    goals_win(team_id).compact.max
  end

  def worst_loss(team_id)
    goals_loss(team_id).compact.min
  end

  def games_won_per_team
    @game_teams.each_with_object(Hash.new(0.0)) do |game, games_won|
      games_won[game.team_id] += 1 if game.result == "WIN"
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

  def most_goals_scored(team_id)
    team_goals = []
    @game_teams.each {|game| team_goals << game.goals if game.team_id == team_id}
    team_goals.max
  end

  def fewest_goals_scored(team_id)
    team_goals = []
    @game_teams.each {|game| team_goals << game.goals if game.team_id == team_id}
    team_goals.min
  end

  def self.from_csv(files)
    StatTracker.new(files)
  end
end