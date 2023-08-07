require "spec_helper"

RSpec.describe GameTeam do 
  describe "#intialize" do 
    it 'exists as a GameTeam class' do 
      game_team_data = {
        game_id: "2012030221",
        team_id: "3",
        hoa: "away",
        result: "LOSS",
        head_coach: "John Tortorella",
        goals: 2,
        shots: "8",
        tackles: "44"
      }

      team1= GameTeam.new(game_team_data)
      expect(team1).to be_a(GameTeam)
    end

    it 'can access attributes in GameTeam class' do
      game_team_data = {
        game_id: "2012030221",
        team_id: "3",
        hoa: "away",
        result: "LOSS",
        head_coach: "John Tortorella",
        goals: 2,
        shots: 8,
        tackles: "44"
      }

      gameteam1= GameTeam.new(game_team_data)

      expect(gameteam1.game_id).to eq("2012030221")
      expect(gameteam1.team_id).to eq("3")
      expect(gameteam1.hoa).to eq("away")
      expect(gameteam1.result).to eq("LOSS")
      expect(gameteam1.head_coach).to eq("John Tortorella")
      expect(gameteam1.goals).to eq(2)
      expect(gameteam1.shots).to eq(8)
      expect(gameteam1.tackles).to eq("44")
    end
  end
end