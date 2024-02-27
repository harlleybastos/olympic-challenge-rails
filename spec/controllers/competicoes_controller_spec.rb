require 'rails_helper'

RSpec.describe CompeticoesController, type: :controller do
  describe 'POST #create' do
    it 'creates a new competition' do
      post :create, params: { competicao: { nome: 'Competição Teste' } }
      expect(response).to have_http_status(:created)
      # Verificar se a competição foi realmente criada
    end
  end
end
