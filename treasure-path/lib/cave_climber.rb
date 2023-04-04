class CaveClimber
  def initialize
    @dx = [-1, 0, 1, 0, 0, 0]
    @dy = [0, 1, 0, -1, 0, 0]
    @dz = [0, 0, 0, 0, 1, -1]
  end

  def can_reach?(pos1, pos2, height)
    return false if pos1[0].nil? || pos1[0] < 0 || pos1[0] >= @map.size ||
                    pos1[1].nil? || pos1[1] < 0 || pos1[1] >= @map[0].size ||
                    pos1[2].nil? || pos1[2] < 0 || pos1[2] >= height ||
                    pos2[0].nil? || pos2[0] < 0 || pos2[0] >= @map.size ||
                    pos2[1].nil? || pos2[1] < 0 || pos2[1] >= @map[0].size ||
                    pos2[2].nil? || pos2[2] < 0 || pos2[2] >= height

    (pos1[0] - pos2[0]).abs + (pos1[1] - pos2[1]).abs + (pos1[2] - pos2[2]).abs <= height
  end

  def bfs(queue, visited, goal, height)
    return false if queue.empty?
  
    curr = queue.shift
    return curr if curr[:pos] == goal
  
    visited[curr[:pos][0]][curr[:pos][1]][curr[:pos][2]] = true
  
    neighbours(curr, height).each do |neighbour|
      next if visited[neighbour[0]][neighbour[1]][neighbour[2]]
  
      queue.push({ pos: neighbour, path: curr[:path] + [neighbour] })
      visited[neighbour[0]][neighbour[1]][neighbour[2]] = true
    end
  
    bfs(queue, visited, goal, height)
  end
  
  def treasure_path(map, positions, h_andre, h_kana)
    start = positions[:andre] + [0]
    goal = positions[:tesouro] + [0]
    visited_andre = Array.new(map.size) { Array.new(map[0].size) { Array.new(h_andre, false) } }
    visited_kana = Array.new(map.size) { Array.new(map[0].size) { Array.new(h_kana, false) } }
  
    andre_path = bfs([ { pos: start, path: [start] } ], visited_andre, positions[:kana] + [0], h_andre)
    return "Sem caminho para o tesouro" if andre_path == false
  
    kana_path = bfs([ { pos: positions[:kana] + [0], path: [positions[:kana] + [0]] } ], visited_kana, goal, h_kana)
    return "Sem caminho para o tesouro" if kana_path == false
  
    "Kana: #{format_path(kana_path[:path])} -> #{format_path(andre_path[:path].reverse)}"
  end
end