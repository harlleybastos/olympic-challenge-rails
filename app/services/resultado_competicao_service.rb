class ResultadoCompeticaoService
  def self.adicionar_resultado(atleta_id, competicao_id, valor, unidade)
    raise 'Atleta é obrigatório !' if atleta_id.nil?

    atleta = AtletaRepository.new.find(atleta_id)
    competicao = CompeticaoRepository.new.find(competicao_id)
    resultado = ResultadoRepository.new.create(valor:, unidade:)

    ResultadoCompeticaoRepository.new.create(atleta:, competicao:, resultado:)
  end
end
