require 'rails_helper'

RSpec.describe CompeticaoService, type: :service do
  describe '.criar_competicao' do
    it 'cria uma nova competição' do
      competicao = CompeticaoService.criar_competicao("100m rasos")
      expect(competicao.nome).to eq("100m rasos")
      expect(competicao.finalizada).to be_falsey
    end
  end

  describe '.adicionar_resultado' do
    let(:competicao) { CompeticaoService.criar_competicao("Lançamento de Dardo") }
    let(:atleta) { Atleta.create(nome: "João") }

    it 'adiciona um resultado a uma competição' do
      resultado = CompeticaoService.adicionar_resultado(competicao.id, atleta.id, 70.43, "m")
      expect(resultado.atleta).to eq(atleta)
      expect(resultado.competicao).to eq(competicao)
      expect(resultado.resultado.valor).to eq(70.43)
    end

    it 'não permite adicionar resultado a uma competição finalizada' do
      CompeticaoService.finalizar_competicao(competicao.id)
      expect {
        CompeticaoService.adicionar_resultado(competicao.id, atleta.id, 75.00, "m")
      }.to raise_error("Competição já finalizada")
    end
  end

  describe '.finalizar_competicao' do
    it 'finaliza uma competição' do
      competicao = CompeticaoService.criar_competicao("Salto em Altura")
      CompeticaoService.finalizar_competicao(competicao.id)
      expect(competicao.reload.finalizada).to be_truthy
    end
  end
end
