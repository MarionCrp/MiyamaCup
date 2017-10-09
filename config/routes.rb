Rails.application.routes.draw do
  devise_for :admins, path: 'admin', path_names: { sign_in: 'login'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :cups, only: [:edit, :update, :new, :create] do
      resources :shiai_categories, only: [:index, :new, :create, :edit, :update] do
      end
    end
    root to: 'cups#edit', id: Cup.first
  end
end
