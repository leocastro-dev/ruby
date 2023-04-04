class VaultOpener
  def board_combination(movement_list, repeated_path_time_loss, running_time, max_time)
    # Define the layout of the board
    board = [
      ['X', 'A', 'X'],
      ['B', 'C', 'D'],
      ['X', 'E', 'X']
    ]

    # Define the starting position of John
    john_position = [0, 1]

    # Define the available movements
    movements = {
      'A' => [[-1, 0], [1, 0], [0, -1]],
      'B' => [[1, 0], [0, -1], [0, 1]],
      'C' => [[0, -1], [0, 1]],
      'D' => [[-1, 0], [0, -1], [0, 1]],
      'E' => [[-1, 0], [0, -1], [1, 0]]
    }

    # Convert the movement list string to an array of locations
    locations = movement_list.split(' -> ')

    # Calculate the total time spent by John
    unique_locations = locations.uniq
    repeated_paths = locations.length - unique_locations.length
    total_time_spent = (locations.length - 1) * running_time + repeated_paths * repeated_path_time_loss

    # Check if the total time spent is greater than the max time
    if total_time_spent > max_time
      return ['Cofre fechado', "Tempo a mais necessário: #{total_time_spent - max_time}"]
    end

    # Iterate through the locations and update John's position on the board
    locations.each do |location|
      movement = movements[location].find do |direction|
        row = john_position[0] + direction[0]
        col = john_position[1] + direction[1]
        row.between?(0, 2) && col.between?(0, 2) && board[row][col] != 'X'
      end

      # Return an error message if the movement is invalid
      if movement.nil?
        return ['Cofre fechado', 'Posição inválida do John']
      end

      # Update John's position on the board
      john_position[0] += movement[0]
      john_position[1] += movement[1]
    end

    # Calculate the remaining time on the clock
    remaining_time = max_time - total_time_spent

    # Check if the vault was opened before time ran out
    if remaining_time >= 0
      ['Cofre aberto', "Tempo sobrando no relógio: #{remaining_time}"]
    else
      ['Cofre fechado', "Tempo a mais necessário: #{-remaining_time}"]
    end
  end
end