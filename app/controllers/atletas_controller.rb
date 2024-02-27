class AtletasController < ApplicationController
  def index
    @atletas = Atleta.all
    render json: @atletas
  end

  def create
    atleta = AtletaService.criar_atleta(atleta_params[:nome])

    if atleta.persisted?
      render json: atleta, status: :created
    else
      render json: atleta.errors, status: :unprocessable_entity
    end
  end

  private

  def atleta_params
    params.require(:atleta).permit(:nome)
  end
end
