Rails.application.routes.draw do
  root 'session#index'
  get 'session' =>'session#index'
  get 'session/create'

  get 'session/destroy'

  get 'users/index'
  get 'users/wish/:id' =>'users#show_wishes'
  get 'users/favs/:id'=>'users#show_favs'
  get 'users/:id' =>'users#show'
  get 'users/:id/set_up' =>'users#set_up'
  get  'apis/get_movie' =>'apis#get_movie'
  get  'apis/get_wish' =>'apis#get_wish'
  get 'apis/discover'=>'apis#discover'
  post 'users' => 'users#create'
  post 'users/carts'=>'users#carts'
  post 'users/wishes' =>'users#wishes'
  post 'session'=>'session#create'
  delete 'session'=>'session#destroy'
  delete 'users/fav/:id'=>'users#remove_favs'
  delete 'users/:id'=>'users#remove_wish'
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
