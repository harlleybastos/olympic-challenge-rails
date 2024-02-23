class ResultadosController < ApplicationController
  def create
    resultado = CompeticaoService.adicionar_resultado(resultado_params[:competicao_id], resultado_params[:atleta_id],
                                                      resultado_params[:valor], resultado_params[:unidade])
    render json: resultado, status: :created
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private

  def resultado_params
    params.require(:resultado).permit(:competicao_id, :atleta_id, :valor, :unidade)
  end
end
