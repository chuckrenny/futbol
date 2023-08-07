require "spec_helper"

RSpec.describe Team do 
  describe "#intialize" do 
    it "exists" do 
      team_data = {
        team_id: "1",
        franchiseid: "2",
        teamname: "Atlanta United",
        abbreviation: "ATL",
        link: "/api/v1/teams/1"
      }

      team1= Team.new(team_data)
      expect(team1).to be_a Team
    end

    it "has attributes" do
      team_data = {
        team_id: "1",
        franchiseid: "2",
        teamname: "Atlanta United",
        abbreviation: "ATL",
        link: "/api/v1/teams/1"
      }

      team1= Team.new(team_data)
      expect(team1.team_id).to eq("1")
      expect(team1.franchise_id).to eq("2")
      expect(team1.team_name).to eq("Atlanta United")
      expect(team1.abbreviation).to eq("ATL")
      expect(team1.link).to eq("/api/v1/teams/1")
    end
  end
end