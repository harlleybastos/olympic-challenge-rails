# frozen_string_literal: true

class ResultadoRepository
  def create(valor, unidade)
    Resultado.create(valor, unidade)
  end

  def find(resultado_id)
    Resultado.find(resultado_id)
  end

  def save(resultado)
    resultado.save
  end
end
