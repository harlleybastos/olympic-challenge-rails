class ResultadoCompeticao < ApplicationRecord
  belongs_to :atleta
  belongs_to :competicao
  belongs_to :resultado
end
