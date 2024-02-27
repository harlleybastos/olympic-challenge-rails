# frozen_string_literal: true

class CompeticaoRepository
  def create(nome, finalizada)
    Competicao.create(nome:, finalizada:)
  end

  def find(competicao_id)
    Competicao.find(competicao_id)
  end

  def save(competicao)
    competicao.save
  end
end
