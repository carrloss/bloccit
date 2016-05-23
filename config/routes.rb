Rails.application.routes.draw do

  resources :topics do
    get 'sponsored_posts/show'
    get 'sponsored_posts/new'
    get 'sponsored_posts/edit'

    resources :posts, except: [:index]
  end

  get 'about' => 'welcome#about'
  root 'welcome#index'
end
