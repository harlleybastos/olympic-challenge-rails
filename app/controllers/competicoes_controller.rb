class CompeticoesController < ApplicationController
  def create
    competicao = CompeticaoService.criar_competicao(competicao_params[:nome])
    render json: competicao, status: :created
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def finalizar
    CompeticaoService.finalizar_competicao(params[:id])
    head :no_content
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found
  end

  def ranking
    ranking = CompeticaoService.calcular_ranking(params[:id])
    render json: ranking
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Competição não encontrada' }, status: :not_found
  end

  private

  def competicao_params
    params.require(:competicao).permit(:nome)
  end
end
