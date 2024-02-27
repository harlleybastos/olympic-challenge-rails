require 'rails_helper'

RSpec.describe AtletasController, type: :request do
  describe 'POST /atletas' do
    let(:valid_attributes) { { atleta: { nome: 'John Doe' } } }

    scenario 'quando a request é valida' do
      post '/atletas', params: valid_attributes

      json = JSON.parse(response.body).deep_symbolize_keys

      expect(json[:nome]).to eq('John Doe')

      expect(response.status).to eq(201)
    end

    scenario 'quando a request é invalida' do
      post '/atletas', params: { atleta: { nome: '' } }

      json = JSON.parse(response.body).deep_symbolize_keys

      expect(response.status).to eq(422)

      expect(json[:nome]).to match(["can't be blank"])
    end
  end
end
