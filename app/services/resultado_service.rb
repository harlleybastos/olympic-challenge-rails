class ResultadoService
  def self.adicionar_resultado(atleta_id, competicao_id, valor, unidade)
    atleta = AtletaRepository.new.find(atleta_id:)
    competicao = CompeticaoRepository.new.find(competicao_id:)

    resultado_repo = ResultadoRepository.new
    resultado = resultado_repo.create(valor:, unidade:)
    resultado_repo.save(resultado)

    ResultadoCompeticao.new.create(atleta, competicao, resultado)
  end
end
