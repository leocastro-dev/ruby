class PagamentoCredito < Pagamento
    attr_accessor :quantidade, :juros, :produto, :preco
  def initialize(credito)
    @quantidade = credito[:quantidade]
    @juros = credito[:juros]
    @produto = credito[:produto]
    @preco = produto.preco
  end

  def calcular_valor
    @valor = @quantidade * @preco
  end

  def atualizar_valor
    @valor += @valor * juros/100
  end
end