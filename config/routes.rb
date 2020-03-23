Rails.application.routes.draw do

  root "pages#home"
  resources :hourly_productions, only: [:new, :index] do
    post :bulk_create, on: :collection
  end
end
