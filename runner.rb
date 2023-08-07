require './lib/stat_tracker'

game_path = './data/games.csv'
team_path = './data/teams.csv'
game_teams_path = './data/game_teams.csv'

locations = {
  games: game_path,
  teams: team_path,
  game_teams: game_teams_path
}

stat_tracker = StatTracker.from_csv(locations)

puts "GAME STATISTICS"
puts "Highest Total Score:"
p stat_tracker.highest_total_score
puts
puts "Lowest Total Score:"
p stat_tracker.lowest_total_score
puts
puts "Total Games:"
p stat_tracker.total_games
puts
puts "Percentage Home Wins:"
p stat_tracker.percentage_home_wins
puts
puts "Percentage Visitor Wins:"
p stat_tracker.percentage_visitor_wins
puts
puts "Percentage Ties:"
p stat_tracker.percentage_ties
puts
puts "Count of Games by Season:"
p stat_tracker.count_of_games_by_season
puts
puts "Average Goals per Game:"
p stat_tracker.average_goals_per_game
puts
puts "Average Goals by Season"
p stat_tracker.average_goals_by_season
puts
puts
puts "LEAGUE STATISTICS"
puts "Count of Teams:"
p stat_tracker.count_of_teams
puts 
puts "Best Offense:"
p stat_tracker.best_offense
puts
puts "Worst Offense:"
p stat_tracker.worst_offense
puts
puts "Highest Scoring Visitor:"
p stat_tracker.highest_scoring_visitor
puts
puts "Highest Scoring Home Team:"
p stat_tracker.highest_scoring_home_team
puts
puts "Lowest Scoring Visitor:"
p stat_tracker.lowest_scoring_visitor
puts
puts "Lowest Scoring Home Team:"
p stat_tracker.lowest_scoring_home_team
puts
puts 
puts "SEASON STATISTICS"
puts "Winningest Coach:"
p stat_tracker.winningest_coach("20132014")
puts
puts "Worst Coach:"
p stat_tracker.worst_coach("20132014")
puts 
puts "Most Accurate Team:"
p stat_tracker.most_accurate_team("20132014")
puts 
puts "Least Accurate Team:"
p stat_tracker.least_accurate_team("20132014")
puts
puts "Most Tackles:"
p stat_tracker.most_tackles("20132014")
puts 
puts "Fewest Tackles:"
p stat_tracker.fewest_tackles("20132014")