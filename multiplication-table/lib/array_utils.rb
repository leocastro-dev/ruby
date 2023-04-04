class ArrayUtils
  def self.multiplos(qtd, multiplo)
    multiplos = []
  
    qtd.times do |valor|
      multiplos << (valor+1)*multiplo
    end
    
    return multiplos
  end

  def self.tabuada(valor)
    tabuada_completa = []

    (1..valor).each do |multiplo|
      tabuada = []
      (1..10).each do |multiplicador|
        tabuada << multiplo * multiplicador
      end
      tabuada_completa << tabuada
    end

    tabuada_completa
  end
end