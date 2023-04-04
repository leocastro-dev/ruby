class WordPuzzle
  def phrase_weight(phrases)
    alfabeto = ('a'..'z').to_a
    peso_total = []
    phrases.each do |phrase|
      palavras = phrase.split(' ')
      peso_frase = 0
      palavras.each do |palavra|
        if palavra.length == 1 || palavra.downcase.chars.sort.join == palavra.downcase
          peso_frase += 0
        else
          peso_palavra = 0
          palavra.each_char do |char|
            if alfabeto.include?(char.downcase)
              peso = alfabeto.index(char.downcase) + 1
              peso *= -1 if char =~ /[A-Z]/
              peso_palavra += peso
            end
          end
          peso_frase += peso_palavra
        end
      end
      peso_total << peso_frase
    end
    peso_total
  end
end