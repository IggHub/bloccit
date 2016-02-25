Rails.application.routes.draw do
#  gets/index'
#  get 'posts/show'
#  get 'posts/new'
#  get 'posts/edit'
#  get 'welcome/index'
#  get 'welcome/about'
#  get 'sponsored_posts/show'

  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts, except: [:index]
  end

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
