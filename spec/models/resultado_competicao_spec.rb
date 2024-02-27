require 'rails_helper'

RSpec.describe ResultadoCompeticao, type: :model do
  describe 'associações' do
    it { should belong_to(:atleta) }
    it { should belong_to(:competicao) }
    it { should belong_to(:resultado) }
  end

  describe 'criação' do
    it 'é valido com atributos' do
      atleta = AtletaService.criar_atleta(nome: 'Marcos Silva')
      competicao = CompeticaoService.criar_competicao('Corrida')
      resultado_competicao = ResultadoCompeticaoService.adicionar_resultado(atleta.id, competicao.id, 11.2, 'm')

      expect(resultado_competicao).to be_valid
    end

    it 'é invalido sem atleta' do
      competicao = CompeticaoService.criar_competicao('Corrida')
      resultado_competicao = ResultadoCompeticaoService.adicionar_resultado(nil, competicao.id, 22.1, 'm')
      expect(resultado_competicao).not_to be_valid
    end

    it 'é invalido sem competição' do
      atleta = AtletaService.criar_atleta(nome: 'Marcos Silva')
      resultado_competicao = ResultadoCompeticaoService.adicionar_resultado(atleta.id, nil, 22.1, 'm')
      expect(resultado_competicao).not_to be_valid
    end
  end
end
