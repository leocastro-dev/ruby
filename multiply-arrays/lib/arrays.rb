class Arrays
  def self.multiplica_antecessor_predecessor(array)
    resultado = []
    array.each_with_index do |num, i|
      if i == 0
        resultado << array[i] * array[i+1]
      elsif i == array.length - 1
        resultado << array[i-1] * array[i]
      else
        resultado << array[i-1] * array[i+1]
      end
    end
    resultado
  end
end