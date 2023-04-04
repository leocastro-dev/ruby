class ProdutoLivro < Produto
    attr_accessor :nome, :preco, :estoque, :autor, :genero, :paginas
  def initialize(livro)
    @nome = livro[:nome]
    @preco = livro[:preco]
    @estoque = livro[:estoque]
    @autor = livro[:autor]
    @genero = livro[:genero]
    @paginas = livro[:paginas]
  end
end