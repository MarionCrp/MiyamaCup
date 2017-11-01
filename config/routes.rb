Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', confirmations: 'users/confirmations', passwords: 'users/passwords' }
  devise_for :admin, path: 'admin', path_names: { sign_in: 'login'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :cups, only: [:edit, :update, :new, :create] do
      resources :shiai_categories, only: [:index, :new, :create, :edit, :update] do
        member do
          put :toggle_enabled
        end
      end
    end
    root to: 'cups#edit'
  end

  namespace :static_pages, path: '' do
    resource :home, only: [:show]
  end

  root to: 'static_pages/home#show'
end
