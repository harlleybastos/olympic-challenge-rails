# frozen_string_literal: true

class AtletaRepository
  def create(nome)
    Atleta.create(nome)
  end

  def find(atleta_id)
    Atleta.find(atleta_id)
  end

  def save(atleta)
    atleta.save
  end
end
