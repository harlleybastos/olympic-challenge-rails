Rails.application.routes.draw do

  resources :atletas, only: [:index, :create]

  resources :competicoes, only: [:create] do
    member do
      post :finalizar, as: :finalizar_competicao
      get :ranking, as: :ranking_competicao
    end
    resources :resultados, only: [:create]
  end

end
