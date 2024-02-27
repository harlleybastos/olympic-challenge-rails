class ResultadoService
  def self.adicionar_resultado(atleta_id, competicao_id, valor, unidade)
    competicao_repo = CompeticaoRepository.new
    competicao = competicao_repo.find(competicao_id)

    raise 'Competição já finalizada' if competicao.finalizada

    atleta_repo = AtletaRepository.new
    atleta = atleta_repo.find(atleta_id)

    resultado_repo = ResultadoRepository.new
    resultado = resultado_repo.create(valor:, unidade:)

    ResultadoCompeticaoRepository.new.create(atleta:, competicao:, resultado:)
  end
end
