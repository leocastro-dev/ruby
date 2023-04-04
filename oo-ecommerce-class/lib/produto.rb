class Produto < Categoria
    attr_accessor :nome, :categoria, :preco, :estoque
  
    def initialize(produto)
      @nome = produto[:nome]
      @categoria = produto[:categoria] || "Geral"
      @preco = produto[:preco]
      @estoque = produto[:estoque]
    end
end