require 'spec_helper'

RSpec.describe Game do
  describe "#initialize" do
    it "exists" do
        game_data = {
          game_id: "2012030221",
          season: "20122013",
          away_team_id: "3",
          home_team_id: "6",
          away_goals: 2,
          home_goals: 3
        }

        game1 = Game.new(game_data)
        expect(game1).to be_a(Game)
    end
  end

    it "has attributes" do
      game_data = {
          game_id: "2012030221",
          season: "20122013",
          away_team_id: "3",
          home_team_id: "6",
          away_goals: 2,
          home_goals: 3
        }

        game1 = Game.new(game_data)
        expect(game1.game_id).to eq("2012030221")
        expect(game1.season).to eq("20122013")
        expect(game1.away_team_id).to eq("3")
        expect(game1.home_team_id).to eq("6")
        expect(game1.away_goals).to eq(2)
        expect(game1.home_goals).to eq(3)
    end
  end


