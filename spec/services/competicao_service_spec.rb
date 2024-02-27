require 'rails_helper'

RSpec.describe CompeticaoService do
  let(:competicao_repo) { instance_double('CompeticaoRepository') }
  let(:atleta_repo) { instance_double('AtletaRepository') }
  let(:resultado_repo) { instance_double('ResultadoRepository') }
  let(:resultado_competicao_repo) { instance_double('ResultadoCompeticaoRepository') }

  let(:competicao) { instance_double('Competicao', finalizada: false) }
  let(:atleta) { instance_double('Atleta') }
  let(:resultado) { instance_double('Resultado') }

  before do
    allow(CompeticaoRepository).to receive(:new).and_return(competicao_repo)
    allow(AtletaRepository).to receive(:new).and_return(atleta_repo)
    allow(ResultadoRepository).to receive(:new).and_return(resultado_repo)
    allow(ResultadoCompeticaoRepository).to receive(:new).and_return(resultado_competicao_repo)
  end

  describe '.criar_competicao' do
    it 'cria uma nova competição' do
      expect(competicao_repo).to receive(:create).with('100m classificatória', false)
      described_class.criar_competicao('100m classificatória')
    end
  end

  describe '.adicionar_resultado' do
    context 'quando a competição não está finalizada' do
      it 'adiciona um resultado à competição' do
        allow(competicao_repo).to receive(:find).and_return(competicao)
        allow(atleta_repo).to receive(:find).and_return(atleta)
        allow(resultado_repo).to receive(:create).and_return(resultado)
        allow(resultado_competicao_repo).to receive(:create)

        described_class.adicionar_resultado(1, 1, 10.0, 's')
        expect(resultado_competicao_repo).to have_received(:create).with(atleta:, competicao:,
                                                                         resultado:)
      end
    end

    context 'quando a competição está finalizada' do
      it 'lança um erro' do
        allow(competicao).to receive(:finalizada).and_return(true)
        allow(competicao_repo).to receive(:find).and_return(competicao)

        expect do
          described_class.adicionar_resultado(1, 1, 10.0, 's')
        end.to raise_error('Competição já finalizada')
      end
    end
  end

  describe '.finalizar_competicao' do
    it 'finaliza uma competição' do
      allow(competicao_repo).to receive(:find).and_return(competicao)
      allow(competicao).to receive(:finalizada=)
      allow(competicao_repo).to receive(:save)

      described_class.finalizar_competicao(1)
      expect(competicao).to have_received(:finalizada=).with(true)
      expect(competicao_repo).to have_received(:save).with(competicao)
    end
  end

  describe '.calcular_ranking' do
    it 'calcula o ranking de uma competição' do
      allow(competicao_repo).to receive(:find).and_return(competicao)
      allow(competicao).to receive(:calcular_ranking)

      described_class.calcular_ranking(1)
      expect(competicao).to have_received(:calcular_ranking)
    end
  end
end
