Rails.application.routes.draw do
  delete 'temps/:id' => 'temps#destroy'

  root 'session#index'
  get 'session' =>'session#index'
  get 'session/create'

  get 'session/destroy'
get 'users/wishlist' => "users#wishlist"
  get 'users/index'
  get 'users/:id' =>'users#show'
  get 'users/:id/set_up' =>'users#set_up'
  get  'apis/top_moive' =>'apis#get_top_movie'
  get 'apis/top_moive/next'=>'apis#top_rated_next'
  get 'apis/top_moive/prev'=>'apis#top_rated_prev'
  get 'apis/get_top_genre_movie/:id' => 'apis#get_top_genre_movie'

  post 'users' => 'users#create'
  post 'users/carts'=>'users#carts'
  post 'session'=>'session#create'
  delete 'session'=>'session#destroy'

  get 'users' => "users#set_up"

  post 'users/add_to_want_watch/:id' => 'users#add_to_want_watch' 

  post 'users/add_to_watched/:id' => 'users#add_to_watched' 

  get 'users/want_watch/:id' => 'users#want_watch'

  get 'users/watched/:id' => 'users#watched'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
