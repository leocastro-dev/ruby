class Categoria
  attr_accessor :nome
  def initialize(nome, categoria, preco, estoque)
    @nome = nome
    @categoria = categoria
    @preco = preco
    @estoque = estoque
  end
end