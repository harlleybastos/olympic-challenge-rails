class AtletaService
  def self.criar_atleta(nome)
    atleta_repo = AtletaRepository.new
    atleta = atleta_repo.create(nome:)
    atleta_repo.save(atleta:)
    atleta
  end
end
