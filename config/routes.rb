Rails.application.routes.draw do
  localized do
    devise_for :user, controllers: { sessions: 'user/sessions', registrations: 'user/registrations', confirmations: 'user/confirmations', passwords: 'user/passwords' }
  end
  devise_for :admin, path: 'admin', path_names: { sign_in: 'login'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :cups, only: [:edit, :update, :new, :create] do
      resources :shiai_categories, only: [:index, :new, :create, :edit, :update] do
        member do
          put :toggle_enabled
        end
      end

      resources :pages, only: [:index, :new, :create, :edit, :update] do
        member do
          put :toggle_visible
        end
      end
    end

    resources :user_profiles, only: [:index, :new, :create, :edit, :update] do
      member do
        put :toggle_disabled
      end
    end

    resource :home, only: [:show]

    root to: 'home#show'
  end


  localized do

    namespace :user do
      resources :user_profiles, only: [:index, :new, :create, :edit, :update] do
        member do
          put :toggle_disabled
        end
      end
      root to: 'user_profiles#index'
    end

    resources :pages, path: '/:locale', only: [:show]

    resource :coming_soon, path: 'coming_soon', only: [:show], controller: "coming_soon"

    root to: 'pages#show'
  end
end
