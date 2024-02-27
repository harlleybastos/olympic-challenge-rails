class ResultadoCompeticaoService
  def self.adicionar_resultado(atleta_id, competicao_id, valor, unidade)
    if atleta_id.nil?
      return ResultadoCompeticao.new.tap { |rc| rc.errors.add(:atleta, 'must exist') }
    end

    atleta = AtletaRepository.new.find(atleta_id)
    competicao = CompeticaoRepository.new.find(competicao_id)
    resultado = ResultadoRepository.new.create(valor:, unidade:)

    ResultadoCompeticaoRepository.new.create(atleta:, competicao:, resultado:)
  end
end
