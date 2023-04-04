class PagamentoBoleto < Pagamento
    attr_accessor :nome, :preco, :valor, :produto
    def initialize(boleto)
        @quantidade = boleto[:quantidade]
        @produto = boleto[:produto]
        @preco = produto.preco
    end

    def calcular_valor
      @valor = @quantidade * @preco
    end
end