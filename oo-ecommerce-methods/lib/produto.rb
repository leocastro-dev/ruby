class Produto < Categoria
  attr_accessor :nome, :categoria, :preco, :estoque

  def initialize(produto_detalhes)
    @nome = produto_detalhes[:nome]
    @categoria = produto_detalhes[:categoria] || Categoria.new("Geral")
    @preco = produto_detalhes[:preco]
    @estoque = produto_detalhes[:estoque]
  end

  def adiciona_estoque(quantidade)
    @estoque += quantidade
  end

  def remove_estoque(quantidade)
    @estoque -= quantidade
  end
end
