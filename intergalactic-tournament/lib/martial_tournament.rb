class MartialTournament
  def get_points(players, starting_points, match_results, played_matches = [])
    points = {}
    
    # Check if players array is empty
    return points if players.empty?
    
    players.each do |player|
      points[player.to_sym] = starting_points[player.to_sym]
    end
    
    File.foreach("data/#{match_results}") do |line|
      match_result = line.chomp.split('>')
      winner = match_result.first.strip.to_sym
      loser = match_result.last.strip.to_sym
      
      # Skip matches that have already been played
      next if played_matches.include?([winner, loser]) || played_matches.include?([loser, winner])
      
      if points.has_key?(winner)
        points[winner] += 2
      else
        puts "Invalid winner in match result: #{winner}"
      end
      
      if points.has_key?(loser)
        points[loser] += 1
      else
        puts "Invalid loser in match result: #{loser}"
      end
    end
    
    points
  end
  
  def get_matches(match_results)
    matches = []
    
    File.foreach("data/#{match_results}") do |line|
      match_result = line.chomp.split('>')
      winner = match_result.first.strip.to_sym
      loser = match_result.last.strip.to_sym
      
      matches << [winner, loser]
    end
    
    matches
  end
  
  def placements(match_results, initial_points, rounds)
    points = get_points(initial_points.keys, initial_points, match_results)
    matches = get_matches(match_results)
  
    result = {}
    sorted_points = points.sort_by { |player, points| [-points.to_i, player.to_s] }
    sorted_points.each.with_index do |player_and_points, index|
      result[(index + 1).to_s.to_sym] = "#{player_and_points.first}:#{player_and_points.last}"
    end
    
    all_results = [result]
    (rounds - 1).times do
      played_matches = []
      
      new_points = get_points(initial_points.keys, initial_points, match_results, played_matches)
      
      sorted_points = new_points.sort_by { |player, points| [-points.to_i, player.to_s] }
      result = {}
      sorted_points.each.with_index do |player_and_points, index|
        result[(index + 1).to_s.to_sym] = "#{player_and_points.first}:#{player_and_points.last}"
      end
      
      all_results << result
      
      # Add the matches played in this round to the list of played matches
      matches_played_this_round = []
      sorted_points.each_cons(2) do |pair|
        matches_played_this_round << pair if matches.include?(pair) || matches.include?(pair.reverse)
      end
      played_matches += matches_played_this_round
    end
    
    all_results
  end
end