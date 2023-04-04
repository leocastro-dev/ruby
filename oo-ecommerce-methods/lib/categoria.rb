class Categoria
  attr_accessor :nome

  def initialize(categoria)
    if categoria.is_a?(Hash)
      @nome = categoria[:nome]
    else
      @nome = categoria || "Geral"
    end
  end

end
