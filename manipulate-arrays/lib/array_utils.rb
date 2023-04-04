class ArrayUtils
  def self.compara(lista1, lista2)
    return false unless lista1.size == lista2.size
    return lista1.sort == lista2.sort
  end
  
  def self.divisiveis(valor1, valor2)
    dois_divisiveis = []
    divisivel_3 = []
    divisivel_5 = []
    resultado_final = [dois_divisiveis, divisivel_3, divisivel_5]
  
    (1..50).each do |num|
      if num % valor1 == 0 && num % valor2 == 0
        dois_divisiveis << num
      elsif num % valor1 == 0
        divisivel_3 << num
      elsif num % valor2 == 0
        divisivel_5 << num
      end
    end
   return resultado_final
  end

  def self.soma(lista)
    lista.sum
  end

  def self.combinar(array1, array2)
    resultado = []
    array1.each do |num|
    array2.each do |letra|
    resultado << [num, letra]
  end
  end
  return resultado

 end
end