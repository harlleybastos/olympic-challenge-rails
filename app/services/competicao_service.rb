class CompeticaoService
  def self.criar_competicao(nome)
    CompeticaoRepository.new.create(nome, false)
  end

  def self.adicionar_resultado(competicao_id, atleta_id, valor, unidade)
    competicao = CompeticaoRepository.new.find(competicao_id)
    raise 'Competição já finalizada' if competicao.finalizada

    atleta = AtletaRepository.new.find(atleta_id)
    resultado = ResultadoRepository.new.create(valor:, unidade:)
    ResultadoCompeticaoRepository.new.create(atleta:, competicao:, resultado:)
  end

  def self.finalizar_competicao(competicao_id)
    competicao_repo = CompeticaoRepository.new
    competicao = competicao_repo.find(competicao_id)
    competicao.finalizada = true
    competicao_repo.save(competicao)
  end

  def self.calcular_ranking(competicao_id)
    competicao = CompeticaoRepository.new.find(competicao_id)
    competicao.calcular_ranking
  end
end
