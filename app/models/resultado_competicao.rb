class ResultadoCompeticao < ApplicationRecord
  validates :atleta, presence: true
  belongs_to :atleta
  belongs_to :competicao
  belongs_to :resultado
end
