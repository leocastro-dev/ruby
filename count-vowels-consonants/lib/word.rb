class Word
  def vowels_count(phrase)
    contador = []
    vogais = ["a", "e", "i", "o", "u", "y", "à", "ã", "á"]
    phrase.each_char do |letra|
      vogais.each do |vogal|
      if letra.downcase == vogal
        contador << letra
      end
      end
    end
    contador.length()
  end

  def consonants_count(phrase)
    contador = []
    vogais = ["a", "e", "i", "o", "u", "y", "à", "ã", "á", "é", "ú", ".", ",", "\s"]
    phrase.each_char do |letra|
      vogais.each do |vogal|
      if letra.downcase == vogal
        contador << letra
      end
      end
    end
    phrase.length() - contador.length()
  end
end
