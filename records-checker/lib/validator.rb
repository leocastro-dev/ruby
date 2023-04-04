class Validator
  REQUIRED_KEYS = [:nome_completo, :cpf, :email, :telefone]

  def initialize(data)
    @data = data
  end

  def data_checker
    missing_keys = REQUIRED_KEYS.select { |key| @data[key].nil? }
    if missing_keys.empty?
      'Válido'
    else
      'Inválido'
    end
  end
end