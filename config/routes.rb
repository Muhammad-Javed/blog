Rails.application.routes.draw do
  resources:posts do
    collection do
      get '/search' => 'posts#search', :as => 'search_post'
    end
    member do
      get 'preview'
    end
    resources:comments
  end
  root "posts#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
