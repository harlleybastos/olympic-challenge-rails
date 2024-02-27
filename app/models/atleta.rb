class Atleta < ApplicationRecord
  validates :nome, presence: true
  has_many :resultado_competicaos
  has_many :competicoes, through: :resultado_competicaos
end
