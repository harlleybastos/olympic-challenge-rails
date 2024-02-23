# frozen_string_literal: true

# CompeticaoRepository é responsável por gerenciar o acesso e persistência
# dos dados relacionados às competições. Ele fornece uma abstração para
# operações de banco de dados, permitindo que os serviços manipulem
# competições sem depender diretamente do ActiveRecord.
class CompeticaoRepository
  def create(nome, finalizada)
    Competicao.create(nome, finalizada)
  end

  def find(competicao_id)
    Competicao.find(competicao_id)
  end

  def save(competicao)
    competicao.save
  end
end
