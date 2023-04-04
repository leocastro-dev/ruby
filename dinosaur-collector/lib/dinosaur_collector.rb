class DinosaurCollector
  def distance(pos1, pos2)
    Math.sqrt((pos2[0] - pos1[0]) ** 2 + (pos2[1] - pos1[1]) ** 2)
  end

  def toy_collecting(toys_positions, dino_position, battery)
    visited = {}
    queue = [[[dino_position], 0, [dino_position]]]
    
    while !queue.empty?
      pos, dist, path = queue.shift
      visited[pos.last] = true
      toys = toys_positions.select { |toy| !visited[toy] }
      
      if toys.empty?
        return [path, visited.keys.size - 1, battery.round(2)]
      end
      
      toys_within_range = toys.select { |toy| battery >= distance(pos.last, toy) }
      if toys_within_range.empty?
        closest_toy = toys.min_by { |toy| distance(pos.last, toy) }
        distance_to_toy = distance(pos.last, closest_toy)
        if battery < distance_to_toy
          return [path, visited.keys.size - 1, battery.round(2)]
        end
        battery -= distance_to_toy
        queue += [[path + [closest_toy], dist + distance_to_toy, path + [closest_toy]]]
        visited[closest_toy] = true
      else
        closest_toy = toys_within_range.min_by { |toy| distance(pos.last, toy) }
        distance_to_toy = distance(pos.last, closest_toy)
        battery -= distance_to_toy
        queue += [[path + [closest_toy], dist + distance_to_toy, path + [closest_toy]]]
        visited[closest_toy] = true
      end
    end
    
    [path, visited.keys.size - 1, battery.round(2)]
  end
end