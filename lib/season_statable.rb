module SeasonStatable

  def all_season_game_id(season)
    @games.map do |game|
      game.game_id if game.season == season
    end.compact 
  end 

  def winningest_coach(season)
    coach_wins = @game_teams.each_with_object(Hash.new([0,0])) do |game, hash|
      if all_season_game_id(season).include?(game.game_id) 
        if game.result == "WIN"
          hash[game.head_coach] = [1 + hash[game.head_coach][0], 1 + hash[game.head_coach][1]]
        else
          hash[game.head_coach] = [hash[game.head_coach][0], 1 + hash[game.head_coach][1]]
        end
      end
    end

    coach_win_percentage = coach_wins.transform_values do |value| 
      (value[0] / value[1].to_f).round(4)
    end

    max_win_percentage = coach_win_percentage.values.max
    coach_win_percentage.key(max_win_percentage)
  end
  
  def worst_coach(season)
    coach_loss = @game_teams.each_with_object(Hash.new([0,0])) do |game, hash|
      if all_season_game_id(season).include?(game.game_id) 
        if game.result == "WIN"
          hash[game.head_coach] = [1 + hash[game.head_coach][0], 1 + hash[game.head_coach][1]]
        else
          hash[game.head_coach] = [hash[game.head_coach][0], 1 + hash[game.head_coach][1]]
        end
      end
    end
    coach_loss_percentage = coach_loss.transform_values do |value| 
      (value[0] / value[1].to_f).round(4)
    end

    min_win_percentage = coach_loss_percentage.values.min
    coach_loss_percentage.key(min_win_percentage)
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
    team_list[total_tackles_by_team_id(season).key(total_tackles_by_team_id(season).values.max)]
  end
  
  def fewest_tackles(season)
    team_list[total_tackles_by_team_id(season).key(total_tackles_by_team_id(season).values.min)]
  end
end