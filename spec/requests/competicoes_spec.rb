require 'rails_helper'

RSpec.describe CompeticoesController, type: :request do
  let!(:competicao) { Competicao.create(nome: '100m classificatoria 1') }

  describe 'POST /competicoes' do
    let(:valid_attributes) { { competicao: { nome: 'Dardo semifinal' } } }

    scenario 'cria uma nova competicao' do
      expect do
        post competicoes_path, params: valid_attributes
      end.to change(Competicao, :count).by(1)
    end
  end

  describe 'POST /competicoes/:id/finalizar' do
    scenario 'finaliza uma competicao' do
      post finalizar_competicao_competico_path(competicao), params: {}
      expect(competicao.reload.finalizada).to be true
    end
  end

  describe 'GET /competicoes/:id/ranking' do
    scenario 'retorna o ranking de uma competicao' do
      get ranking_competicao_competico_path(competicao)
      expect(response).to have_http_status(:ok)
    end
  end
end
