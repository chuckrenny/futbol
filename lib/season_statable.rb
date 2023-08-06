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

  def avg_goals_made(season)
    goals = @game_teams.each_with_object(Hash.new([0,0])) { |game, hash|
        if all_season_game_id(season).include?(game.game_id)
            hash[game.team_id] = [game.goals + hash[game.team_id][0], game.shots + hash[game.team_id][1]]
        end
    }.transform_values { |value| (value[0] / value[1].to_f).round(4) }
  end

  def most_accurate_team(season)
      avg_goals = avg_goals_made(season)
      team_list[avg_goals.key(avg_goals.values.max)]
  end

  def least_accurate_team(season)
      avg_goals = avg_goals_made(season)
      team_list[avg_goals.key(avg_goals.values.min)]
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