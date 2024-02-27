# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Atleta, type: :model do
  it 'é valido com atributos válidos' do
    atleta = AtletaService.criar_atleta(nome: 'Julio da Silva')
    expect(atleta).to be_valid
  end

  it 'não é valido sem nome' do
    atleta = AtletaService.criar_atleta(nil)
    expect(atleta).not_to be_valid
  end
end
