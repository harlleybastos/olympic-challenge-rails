# spec/models/resultado_spec.rb

require 'rails_helper'

RSpec.describe Resultado, type: :model do
  # Let's assume you will add validations for 'valor' and 'unidade' presence
  describe 'validations' do
    it 'is valid with valid attributes' do
      resultado = ResultadoService.adicionar_resultado(valor: '9.58', unidade: 's')
      expect(resultado).to be_valid
    end

    it 'is not valid without a valor' do
      resultado = Resultado.new(valor: nil, unidade: 's')
      expect(resultado).not_to be_valid
    end

    it 'is not valid without a unidade' do
      resultado = Resultado.new(valor: '9.58', unidade: nil)
      expect(resultado).not_to be_valid
    end
  end

  # Add tests for any associations you have in your model
  # For example, if 'Resultado' belongs to 'Atleta' and 'Competicao'
  describe 'associations' do
    it 'belongs to atleta' do
      assc = Resultado.reflect_on_association(:atleta)
      expect(assc.macro).to eq :belongs_to
    end

    it 'belongs to competicao' do
      assc = Resultado.reflect_on_association(:competicao)
      expect(assc.macro).to eq :belongs_to
    end
  end

  # Add tests for any custom methods you add to the Resultado model
  # For example, if you add a method `formatted_value`
  describe 'methods' do
    # Assuming you add a method like 'formatted_value'
    it 'returns the valor with the unidade' do
      resultado = Resultado.new(valor: '9.58', unidade: 's')
      expect(resultado.formatted_value).to eq '9.58s'
    end
  end
end
