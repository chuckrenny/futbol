require_relative 'spec_helper'

RSpec.describe StatTracker do
  # let(:game_path) {'./data/data_games.csv'}
  # let(:team_path) {'./data/data_teams.csv'}
  # let(:game_teams_path) {'./data/data_game_teams.csv'}
  # let(:locations) {{
  #   games: game_path,
  #   teams: team_path,
  #   game_teams: game_teams_path
  # }}

  let(:game_path) {'./data/games.csv'}
  let(:team_path) {'./data/teams.csv'}
  let(:game_teams_path) {'./data/game_teams.csv'}
  let(:locations) {{
    games: game_path,
    teams: team_path,
    game_teams: game_teams_path
  }}
  let(:stat_tracker) { StatTracker.from_csv(locations) }

  describe "#initialize" do 
    it "exists" do 
      expect(stat_tracker).to be_a StatTracker
    end
  end

  describe "Game Statistics" do 
    it "#highest_total_score" do 
      expect(stat_tracker.highest_total_score).to be_a(Integer)
      expect(stat_tracker.highest_total_score).to eq(11)
    end

    it "#lowest_total_score" do 
      expect(stat_tracker.lowest_total_score).to be_a(Integer)
      expect(stat_tracker.lowest_total_score).to eq(0)
    end

    it "#total_games" do
      expect(stat_tracker.total_games).to be_a(Float)
      expect(stat_tracker.total_games).to eq(7441)
    end

    it "#percentage_home_wins" do
      expect(stat_tracker.percentage_home_wins).to be_a(Float)
      expect(stat_tracker.percentage_home_wins).to eq(0.44)
    end
    
    it "#percentage_visitor_wins" do
      expect(stat_tracker.percentage_visitor_wins).to be_a(Float)
      expect(stat_tracker.percentage_visitor_wins).to eq(0.36)
    end

    it "#percentage_ties" do
      expect(stat_tracker.percentage_ties).to be_a(Float)
      expect(stat_tracker.percentage_ties).to eq(0.2)
    end
        
    it "#average_goals_per_game" do
      expect(stat_tracker.average_goals_per_game).to be_a(Float)
    end

    it "#count_of_games_by_season" do
      expect(stat_tracker.count_of_games_by_season).to be_a(Hash)
      expect(stat_tracker.count_of_games_by_season.keys[0]).to be_a(String)
      expect(stat_tracker.count_of_games_by_season.values[0]).to be_a(Integer)
    end 

    it "#total_goals_by_season" do 
      expect(stat_tracker.total_goals_by_season).to be_a Hash

      expected = {
        "20122013"=>3322.0,
        "20162017"=>5565.0,
        "20142015"=>5461.0,
        "20152016"=>5499.0,
        "20132014"=>5547.0,
        "20172018"=>6019.0
      }
    
      expect(stat_tracker.total_goals_by_season).to eq(expected)
    end

    it "#average_goals_by_season" do
      expect(stat_tracker.average_goals_by_season).to be_a(Hash)
      
      expected = {
        "20122013"=>4.12,
        "20162017"=>4.23,
        "20142015"=>4.14,
        "20152016"=>4.16,
        "20132014"=>4.19,
        "20172018"=>4.44
      }
      
      expect(stat_tracker.average_goals_by_season).to eq(expected)
    end
  end

  describe "League Statistics" do
    it "#count_of_teams" do
      expect(stat_tracker.count_of_teams).to be_a(Integer)
    end

    it "#team_list" do
      expect(stat_tracker.team_list).to be_a(Hash)
    end

    it "#total_goals_made_per_team" do
    
      expect(stat_tracker.total_goals_made_per_team).to be_a(Hash)
    end

    it "#games_played_per_team" do
  
      expect(stat_tracker.games_played_per_team).to be_a(Hash)
    end

    it "#average_goals_per_team_id" do
      expect(stat_tracker.average_goals_per_team_id).to be_a(Hash)
    end

    it "#best_offense" do
      expect(stat_tracker.best_offense).to be_a(String)
      expect(stat_tracker.best_offense).to eq "Reign FC"

    end
    
    it "#worst_offense" do
      expect(stat_tracker.worst_offense).to be_a(String)
      expect(stat_tracker.worst_offense).to eq "Utah Royals FC"
    end

    it "#total_home_goals" do
      expect(stat_tracker.total_home_goals).to be_a(Hash)
    end

    it "#avg_goals_results" do
      total_goals_sample = {
        "17"=>[504, 247],
        "16"=>[558, 266],
        "9"=>[498, 248],
        "8"=>[500, 249],
        "30"=>[506, 252],
        "26"=>[519, 256],
        }
      expect(stat_tracker.avg_goals_results(total_goals_sample)).to be_a(Hash)
    end

    it "#highest_scoring_home_team" do
      expect(stat_tracker.highest_scoring_home_team).to be_a(String)
      expect(stat_tracker.highest_scoring_home_team).to eq("Reign FC")
    end

    it "#lowest_scoring_home_team" do
      expect(stat_tracker.lowest_scoring_home_team).to be_a(String)
      expect(stat_tracker.lowest_scoring_home_team).to eq("Utah Royals FC")
    end

    it "#total_away_goals" do 
      expect(stat_tracker.total_away_goals).to be_a(Hash)
    end

    it "#highest_scoring_visitor" do 
      expect(stat_tracker.highest_scoring_visitor).to be_a(String)
      expect(stat_tracker.highest_scoring_visitor).to eq( "FC Dallas")
    end

    it "#lowest_scoring_visitor" do 
      expect(stat_tracker.lowest_scoring_visitor).to be_a(String)
      expect(stat_tracker.lowest_scoring_visitor).to eq( "San Jose Earthquakes")
    end
  end

  describe "Season Statistics" do
    it "#winningest_coach" do
      expect(stat_tracker.winningest_coach("20132014")).to eq("Claude Julien")
    end

    it "#worst_coach" do
      expect(stat_tracker.worst_coach("20132014")).to eq "Peter Laviolette"
      expect(stat_tracker.worst_coach("20142015")).to eq("Craig MacTavish").or(eq("Ted Nolan"))
    end
    
    it "#most_accurate_team" do
      expect(stat_tracker.most_accurate_team("20132014")).to be_a(String)
      expect(stat_tracker.most_accurate_team("20132014")).to eq("Real Salt Lake")
    end

    it "#least_accurate_team" do
      expect(stat_tracker.least_accurate_team("20132014")).to be_a(String)
      expect(stat_tracker.least_accurate_team("20132014")).to eq("New York City FC")
    end

    it "all_season_game_id" do 
      expect(stat_tracker.all_season_game_id("20132014")).to be_a(Array)
      expect(stat_tracker.all_season_game_id("20132014")).to all be_a(String)
    end

    it "total_tackles_by_team_id" do 
      expect(stat_tracker.total_tackles_by_team_id("20132014")).to be_a Hash
     end

    it "#most_tackles" do 
      expect(stat_tracker.most_tackles("20132014")).to be_a(String)
      expect(stat_tracker.most_tackles("20132014")).to eq "FC Cincinnati"
      expect(stat_tracker.most_tackles("20142015")).to eq "Seattle Sounders FC"
    end

    it "#fewest_tackles" do 
      expect(stat_tracker.fewest_tackles("20132014")).to be_a (String)
      expect(stat_tracker.fewest_tackles("20132014")).to eq "Atlanta United"
      expect(stat_tracker.fewest_tackles("20142015")).to eq "Orlando City SC"
    end

  end
end