class DataControl
  def initialize(data_list)
    @data_list = data_list
  end

  def validate_data_list
    invalid_indexes = []

    @data_list.each_with_index do |data, index|
      # check if nome_completo has at least 2 words
      if data[:nome_completo].split.size < 2
        invalid_indexes << index
      elsif !data[:aniversario].match?(/^\d{2}\/\d{2}\/\d{4}$/)
        # check if aniversario is a valid date
        invalid_indexes << index
      elsif data[:cpf].size != 11
        # check if cpf has 11 digits
        invalid_indexes << index
      end
    end

    if invalid_indexes.empty?
      'Todos são válidos'
    else
      invalid_indexes
    end
  end
end