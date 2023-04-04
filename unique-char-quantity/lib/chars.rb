class Chars
  def unique_quantity(text)
    contador = []
    valor = 0
    text.split("\s").each do |palavra|
      contador << palavra
    end
    contador.each do |letras|
      valor = valor + letras.split(//).uniq.count()
    end
    valor
  end
end
