class GameShow
  def commercial_breaks(breaks, maximum_time)
    breaks_needed = 0
    current_time = 0

    breaks.each do |duration|
      current_time += duration
      if current_time > maximum_time
        breaks_needed += 1
        current_time = duration
      end
    end

    [[breaks_needed]]
  end
end