Rails.application.routes.draw do
# main routes
root "home#index"
get "home#about_us", to: "home#about_us", as: :about_us
get "home#contact_us", to: "home#contact_us", as: :contact_us

get  "signup/salon",   to: "salon_registrations#new",    as: :new_salon_registration
post "signup/salon",   to: "salon_registrations#create", as: :salon_registrations

  namespace :settings do
    get "/", to: "dashboard#show", as: :root

    resource :password, only: [ :show, :update ]
    resource :profile, only: [ :show, :update ]
    resource :user, only: [ :show, :destroy ]
  end

  mount Avo::Engine, at: "/avo"
  resource :sign_up
  resource :session
  resources :passwords, param: :token
  get "up" => "rails/health#show", as: :rails_health_check




  # subdomain routes
  constraints subdomain: /.+/ do
    get "dashboard", to: "dashboard#index", as: :dashboard
    resources :services do
      collection do
        get :search
      end
    end
    resources :schedules
    resources :manicurists
      resources :bookings, only: [ :new, :create, :index, :destroy ] do
        member do
            get :success
        end
      end
  end
end
