class Pagamento < Produto
    attr_accessor :quantidade, :produto, :preco, :valor
    def initialize(item)
        @quantidade = item[:quantidade]
        @produto = item[:produto] || "Sem nome"
        @preco = item[:preco]
        @valor = item[:quantidade] * item[:preco]
    end

    def calcular_valor()
        @valor = @quantidade * @preco
    end
    
    def aplicar_desconto(desconto)
        @valor -= desconto
    end

end
