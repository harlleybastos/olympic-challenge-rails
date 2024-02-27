# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Competicao, type: :model do
  it 'é valido com atributos válidos' do
    competicao = CompeticaoService.criar_competicao('Competição Teste')
    expect(competicao).to be_valid
  end

  it 'is not valid without a name' do
    competicao = CompeticaoService.criar_competicao(nil)
    expect(competicao).not_to be_valid
  end

  describe '#calcular_ranking' do
    it 'correctly calculates the ranking of athletes' do
      competicao = CompeticaoService.criar_competicao('100m Rasos')
      atleta1 = AtletaService.criar_atleta(nome: 'Usain Bolt')
      atleta2 = AtletaService.criar_atleta(nome: 'Tyson Gay')
      atleta3 = AtletaService.criar_atleta(nome: 'Yohan Blake')

      CompeticaoService.adicionar_resultado(competicao.id, atleta1.id, 9.58, 'segundos')
      CompeticaoService.adicionar_resultado(competicao.id, atleta2.id, 9.69, 'segundos')
      CompeticaoService.adicionar_resultado(competicao.id, atleta3.id, 9.75, 'segundos')

      ranking = CompeticaoService.calcular_ranking(competicao.id)

      expect(ranking.first[:atleta]).to eq(atleta1.nome)
      expect(ranking.second[:atleta]).to eq(atleta2.nome)
      expect(ranking.third[:atleta]).to eq(atleta3.nome)
    end
  end

  describe '#finalizar!' do
    it 'finalizes the competition' do
      competicao = CompeticaoService.criar_competicao('Salto em Altura')
      competicao.finalizar!
      expect(competicao.finalizada).to be_truthy
    end
  end
end
