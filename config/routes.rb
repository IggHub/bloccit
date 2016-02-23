Rails.application.routes.draw do
#  get 'posts/index'
#  get 'posts/show'
#  get 'posts/new'
#  get 'posts/edit'
#  get 'welcome/index'
#  get 'welcome/about'

  resources :topics do
    resources :sponsored_post, :posts, except: [:index]

  end


  get 'about' => 'welcome#about'

  root 'welcome#index'

end
