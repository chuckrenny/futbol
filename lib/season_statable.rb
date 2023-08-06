module SeasonStatable

  def all_season_game_id(season)
    @games.map do |game|
      game.game_id if game.season == season
    end.compact 
  end 

  def wins_per_coach(season) 
    coach_wins = @game_teams.each_with_object(Hash.new([0,0])) do |game, hash|
      if all_season_game_id(season).include?(game.game_id) 
        if game.result == "WIN"
          hash[game.head_coach] = [1 + hash[game.head_coach][0], 1 + hash[game.head_coach][1]]
        else
          hash[game.head_coach] = [hash[game.head_coach][0], 1 + hash[game.head_coach][1]]
        end
      end 
    end
    coach_wins
  end

  def coach_sucess_percentage(season)
    wins_per_coach(season).transform_values do |value| 
      (value[0] / value[1].to_f).round(4)
    end
  end

  def winningest_coach(season)
    max_win_percentage = coach_sucess_percentage(season).values.max
    coach_sucess_percentage(season).key(max_win_percentage)
  end
  
  def worst_coach(season)
    min_win_percentage = coach_sucess_percentage(season).values.min
    coach_sucess_percentage(season).key(min_win_percentage)
  end
  
  def most_accurate_team(season)
    all_season_game_id = @games.map do |game|
      game.game_id if game.season == season
    end.compact

    team_id_goals_shots = @game_teams.each_with_object(Hash.new([0,0])) do |game, hash|
      if all_season_game_id.include?(game.game_id)
        hash[game.team_id] = [game.goals + hash[game.team_id][0], game.shots + hash[game.team_id][1]]
      end
    end
    
    avg_goals_made = team_id_goals_shots.transform_values do |value|
      (value[0] / value[1].to_f).round(4)
    end

    team_name = avg_goals_made.key(avg_goals_made.values.max)
    team_list[team_name]
  end

  def least_accurate_team(season)
    all_season_game_id = @games.map do |game|
      game.game_id if game.season == season
    end.compact
    
    team_id_goals_shots = @game_teams.each_with_object(Hash.new([0,0])) do |game, hash|
      if all_season_game_id.include?(game.game_id)
        hash[game.team_id] = [game.goals + hash[game.team_id][0], game.shots + hash[game.team_id][1]]
      end
    end
    
    avg_goals_made = team_id_goals_shots.transform_values do |value|
      (value[0] / value[1].to_f).round(4)
    end
    
    team_name = avg_goals_made.key(avg_goals_made.values.min)
    team_list[team_name]
  end

  def total_tackles_by_team_id(season)
    @game_teams.each_with_object(Hash.new(0)) do |game, hash|
      if all_season_game_id(season).include?(game.game_id)
        hash[game.team_id] += game.tackles.to_i
      end
    end
  end

  def most_tackles(season)
    team_with_most_tackles = total_tackles_by_team_id(season).values.max
    most_tackles = total_tackles_by_team_id(season).key(team_with_most_tackles)
    team_list[most_tackles]
  end

  def fewest_tackles(season)
    team_with_fewest_tackles = total_tackles_by_team_id(season).values.min
    fewest_tackles = total_tackles_by_team_id(season).key(team_with_fewest_tackles)
    team_list[fewest_tackles]
  end
end