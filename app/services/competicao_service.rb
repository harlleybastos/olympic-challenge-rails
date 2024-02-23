class CompeticaoService
  def self.criar_competicao(nome)
    Competicao.create(nome:, finalizada: false)
  end

  def self.adicionar_resultado(competicao_id, atleta_id, valor, unidade)
    competicao = Competicao.find(competicao_id)
    raise 'Competição já finalizada' if competicao.finalizada

    atleta = Atleta.find(atleta_id)
    resultado = Resultado.create(valor:, unidade:)
    ResultadoCompeticao.create(atleta:, competicao:, resultado:)
  end

  def self.finalizar_competicao(competicao_id)
    competicao = Competicao.find(competicao_id)
    competicao.update(finalizada: true)
  end
end
