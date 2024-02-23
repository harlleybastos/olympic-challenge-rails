class Competicao < ApplicationRecord
  has_many :resultado_competicaos
  has_many :atletas, through: :resultado_competicaos
  has_many :resultados, through: :resultado_competicaos

  def calcular_ranking
    resultado_competicaos
      .includes(:atleta, :resultado)
      .order('resultados.valor ASC')
      .map.with_index(1) do |resultado_competicao, index|
      {
        posicao: index,
        atleta: resultado_competicao.atleta.nome,
        resultado: resultado_competicao.resultado.valor
      }
    end
  end

  def finalizar!
    self.finalizada = true
    save!
  end
end
