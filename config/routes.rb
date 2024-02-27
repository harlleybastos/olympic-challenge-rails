Rails.application.routes.draw do
  resources :competicoes, only: [:create] do
    member do
      post :finalizar
      get :ranking
    end
    resources :resultados, only: [:create]
  end

  resources :atletas, only: [:create]
end
