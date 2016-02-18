Rails.application.routes.draw do
=begin  get 'questions/index'
  get 'questions/new'
  get 'questions/create'
  get 'questions/show'
  get 'questions/edit'
  get 'questions/update'
  get 'questions/destroy'
=end
#  get 'posts/index'
#  get 'posts/show'
#  get 'posts/new'
#  get 'posts/edit'
#  get 'welcome/index'
#  get 'welcome/about'

  resources :posts, :questions


  get 'about' => 'welcome#about'

  root 'welcome#index'

end
