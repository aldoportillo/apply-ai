Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  resources :resumes
  resources :experiences
  resources :skills
  resources :educations
  resources :applications
  resources :bookmarks, only: [ :index, :create, :destroy ]
  resources :watchings, only: [ :index, :create, :destroy ]
  resources :job_postings do
    resources :applications, only: [ :new, :create ]
    resource :bookmark, only: [ :create, :destroy ]
    resource :watching, only: [ :create, :destroy ]
  end
  resources :companies do
    resources :job_postings, only: [ :index ]
  end

  root "job_postings#index"
end
