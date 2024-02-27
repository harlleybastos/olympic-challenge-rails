require 'rails_helper'

RSpec.describe ResultadosController, type: :request do
  let!(:competicao) { Competicao.create(nome: '100m classificatoria 1') }
  let!(:atleta) { Atleta.create(nome: 'Usain Bolt') }

  describe 'POST /competicoes/:competicao_id/resultados' do
    let(:valid_attributes) do
      { resultado: { competicao_id: competicao.id, atleta_id: atleta.id, valor: '9.58', unidade: 's' } }
    end

    it 'creates a new Resultado for the Competicao' do
      expect do
        post competico_resultados_path(competicao), params: valid_attributes
      end.to change(ResultadoCompeticao, :count).by(1)
    end

    it 'returns a created status' do
      post competico_resultados_path(competicao), params: valid_attributes
      expect(response).to have_http_status(:created)
    end
  end
end
