Rails.application.routes.draw do
  unless %{production test}.include?(Rails.env)
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :appointments, only: [:index, :create, :destroy] do
    collection do
      post :export
    end
  end

  resources :email_templates, only: [:index, :show, :edit, :update] do
    member do
      post :preview
    end
  end

  root 'email_templates#index'

end
