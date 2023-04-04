class Numbers
  def sum_text(numbers_text)
    numeros = []
    numbers_text.split.each do |numero|
      numeros << numero.to_i
    end

    numeros.sum

  end
end
