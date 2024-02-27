# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CompeticaoService, type: :service do
  describe '.criar_competicao' do
    it 'cria uma nova competição' do
      competicao = CompeticaoService.criar_competicao('100m rasos')
      expect(competicao.nome).to eq('100m rasos')
      expect(competicao.finalizada).to be_falsey
    end
  end

  describe '.adicionar_resultado' do
    let(:competicao) { CompeticaoService.criar_competicao('Lançamento de Dardo') }
    let(:atleta) { AtletaService.criar_atleta('João') }

    it 'adiciona um resultado a uma competição' do
      resultado = CompeticaoService.adicionar_resultado(competicao.id, atleta.id, 70.43, 'm')
      expect(resultado.atleta).to eq(atleta)
      expect(resultado.competicao).to eq(competicao)
      expect(resultado.resultado.valor).to eq(70.43)
    end

    it 'não permite adicionar resultado a uma competição finalizada' do
      CompeticaoService.finalizar_competicao(competicao.id)
      expect do
        CompeticaoService.adicionar_resultado(competicao.id, atleta.id, 75.00, 'm')
      end.to raise_error('Competição já finalizada')
    end
  end

  describe '.calcular_ranking' do
    let(:competicao) { CompeticaoService.criar_competicao('100m rasos') }
    let(:atleta1) { AtletaService.criar_atleta('Alice') }
    let(:atleta2) { AtletaService.criar_atleta('Bob') }
    let(:atleta3) { AtletaService.criar_atleta('Charlie') }

    before do
      CompeticaoService.adicionar_resultado(competicao.id, atleta1.id, 10.2, 's')
      CompeticaoService.adicionar_resultado(competicao.id, atleta2.id, 10.3, 's')
      CompeticaoService.adicionar_resultado(competicao.id, atleta3.id, 10.1, 's')
      CompeticaoService.finalizar_competicao(competicao.id)
    end

    it 'calcula e retorna o ranking dos atletas' do
      ranking = CompeticaoService.calcular_ranking(competicao.id)
      expect(ranking.first[:atleta]).to eq('{:nome=>"Charlie"}')
      expect(ranking[1][:atleta]).to eq('{:nome=>"Alice"}')
      expect(ranking[2][:atleta]).to eq('{:nome=>"Bob"}')
    end
  end

  describe '.finalizar_competicao' do
    it 'finaliza uma competição' do
      competicao = CompeticaoService.criar_competicao('Salto em Altura')
      CompeticaoService.finalizar_competicao(competicao.id)
      expect(competicao.reload.finalizada).to be_truthy
    end
  end
end
