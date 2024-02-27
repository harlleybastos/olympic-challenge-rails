# spec/models/resultado_spec.rb

require 'rails_helper'

RSpec.describe Resultado, type: :model do
  let!(:competicao) { Competicao.create(nome: '100m classificatoria 1') }
  let!(:atleta) { Atleta.create(nome: 'Usain Bolt') }

  describe 'validations' do
    it 'is valid with valid attributes' do
      resultado = ResultadoService.adicionar_resultado(atleta.id, competicao.id, 22.1, 's')
      expect(resultado).to be_valid
    end

    it 'não é valido sem valor' do
      expect do
        ResultadoService.adicionar_resultado(atleta.id, competicao.id, nil, 's')
      end.to raise_error(RuntimeError, 'Valor e Unidade são obrigatórios !')
    end

    it 'não é valido sem unidade' do
      expect do
        ResultadoService.adicionar_resultado(atleta.id, competicao.id, 11.2, nil)
      end.to raise_error(RuntimeError, 'Valor e Unidade são obrigatórios !')
    end
  end
end
