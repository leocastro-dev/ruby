class NavalBattle
  def initialize(player_a, player_b, matrix_size, attacks)
    @player_a = player_a
    @player_b = player_b
    @matrix_size = matrix_size
    @attacks = attacks
    @matrix_a = Array.new(matrix_size.split('x')[0].to_i) { Array.new(matrix_size.split('x')[1].to_i, '0') }
    @matrix_b = Array.new(matrix_size.split('x')[0].to_i) { Array.new(matrix_size.split('x')[1].to_i, '0') }
  end

  def result
    attacks_a = []
    attacks_b = []
    @points_a = 0
    @points_b = 0

    @attacks.each_line do |attack|
      player = attack[0]
      coords = attack[5..-3].split(',').map(&:to_i)
      if player == 'A'
        result = make_attack(coords, @player_b, @matrix_b)
        attacks_a << [coords, result]
        @points_a += result
      elsif player == 'B'
        result = make_attack(coords, @player_a, @matrix_a)
        attacks_b << [coords, result]
        @points_b += result
      end
    end

    if @points_a > @points_b
      winner = 'Jogador A'
      winner_points = @points_a
      loser = 'Jogador B'
      loser_points = @points_b
      winner_matrix = @matrix_a.map(&:dup)
      loser_matrix = @matrix_b.map(&:dup)
    elsif @points_b > @points_a
      winner = 'Jogador B'
      winner_points = @points_b
      loser = 'Jogador A'
      loser_points = @points_a
      winner_matrix = @matrix_b.map(&:dup)
      loser_matrix = @matrix_a.map(&:dup)
    else
      winner = 'Empate'
      winner_points = @points_a
      loser_points = @points_b
      winner_matrix = []
      loser_matrix = []
    end

    {
      vencedor: winner,
      pontos_a: winner == 'Jogador A' ? winner_points : loser_points,
      pontos_b: winner == 'Jogador B' ? winner_points : loser_points,
      matriz: loser_matrix
    }
  end

  private

  def make_attack(coords, opponent, matrix)
    x, y = coords
    if matrix[x][y] != '0'
      return 0
    end
    opponent.each do |ship, locations|
      if locations.include?(coords)
        matrix[x][y] = 'X'
        locations.delete(coords)
        if locations.empty?
          return ship == :navio_de_guerra ? 3 : 2
        else
          return 1
        end
      end
    end
    matrix[x][y] = 'B'
    0
  end
end