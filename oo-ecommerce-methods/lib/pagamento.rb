class Pagamento
  attr_accessor :produto, :quantidade, :preco, :valor, :estoque

  def initialize(pagamento)
    @quantidade = pagamento[:quantidade] 
    @produto = pagamento[:produto]
    @preco = produto.preco
    @estoque = produto.estoque
  end

  def calcular_valor
    @valor = @quantidade * @preco
    produto.estoque = @estoque - @quantidade
  end

  def aplicar_desconto(porcentagem)
    @valor -= @valor * porcentagem/100
  end
end

