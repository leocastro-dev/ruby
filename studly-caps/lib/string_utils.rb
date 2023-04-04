class StringUtils
  def wavefy(string)
    frase = ""
    string.chars.each_with_index do |letra, index|
      if index.even?
        frase += letra.downcase
      else
        frase += letra.upcase
      end
    end
    frase
  end
end