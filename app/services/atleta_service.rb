class AtletaService
  def self.criar_atleta(nome)
    atleta_repo = AtletaRepository.new
    atleta_repo.create(nome:)
  end

  def self.find(id)
    atleta_repo = AtletaRepository.new
    atleta_repo.find(id:)
  end
end
