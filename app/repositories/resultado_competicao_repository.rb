# frozen_string_literal: true

class ResultadoCompeticaoRepository
  def create(atleta, competicao, resultado)
    ResultadoCompeticao.create(atleta, competicao, resultado)
  end
end
