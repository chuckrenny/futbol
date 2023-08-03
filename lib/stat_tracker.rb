require 'csv'
require_relative 'team'
require_relative 'game'
require_relative "game_team"

class StatTracker
  attr_reader :games, :teams, :game_teams
  def initialize(files)
    @games = (CSV.foreach files[:games], headers: true, header_converters: :symbol).map do |row|
      Game.new(row)
    end
    @teams = (CSV.foreach files[:teams], headers: true, header_converters: :symbol).map do |row|
      Team.new(row)
    end
    @game_teams = (CSV.foreach files[:game_teams], headers: true, header_converters: :symbol).map do |row|
      GameTeam.new(row)
    end
  end

  def highest_total_score
    @games.map { |game| game.away_goals + game.home_goals }.max
  end

  def lowest_total_score
    @games.map { |game| game.away_goals + game.home_goals }.min
  end

  def total_games
    @games.count { |game| game }.to_f
  end

  def percentage_home_wins
    home_wins = @game_teams.count do |game|
      game.result == "WIN" && game.hoa == "home"
    end

    (home_wins / self.total_games).round(2)*100
  end
  
  def percentage_visitor_wins
    visitor_wins = @game_teams.count do |game|
      game.result == "WIN" && game.hoa == "away"
    end

    (visitor_wins / self.total_games).round(2)*100
  end

  def percentage_ties
    ties = @game_teams.count do |game|
      game.result == "TIE" && game.hoa == "away"
    end

    (ties / self.total_games).round(2)*100
  end

  def count_of_games_by_season
    game_count = {}
    @games.each do |game|
      if game_count[game.season]
        game_count[game.season] += 1
      else
        game_count[game.season] = 1
      end
    end
    game_count
  end

  def count_of_games_by_season
    @games.each_with_object(Hash.new(0)) { |game, game_count| game_count[game.season] += 1 }
  end
  
  def self.from_csv(files)
    StatTracker.new(files)
  end
end