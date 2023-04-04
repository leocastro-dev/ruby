class Arrays
  def self.converte_impares_por(lista, numero)
    conversor = []
    multiplos = []
    resultado = [conversor, multiplos]
    lista.each do |item|
      if item.odd?()
        conversor << item

      end
    end
    lista.each do |item|
      if item.odd?()
        multiplos << item*numero

      end
    end
    return resultado
  end
  def self.converte_pares_por(lista, numero)
    conversor = []
    multiplos = []
    resultado = [conversor, multiplos]
    lista.each do |item|
      if item.even?()
        conversor << item

      end
    end
    lista.each do |item|
      if item.even?()
        multiplos << item*numero

      end
    end
    return resultado

  end
end
