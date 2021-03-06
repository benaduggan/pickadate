UnknownBusiness::Application.routes.draw do
  #resources :floors
  resources :dorms

  get "dorms/:dorm_id/floors" => "application#floors", :as => "floors", :format => :json
  
  match 'auth/:provider/callback' => 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout' => 'sessions#destroy', as: 'signout', via: [:get, :post]

  
	root 'static_pages#home'
  
	get 'home', to: "static_pages#home", as: 'home'
	get 'help', to: "static_pages#help", as: 'help'
	get 'about', to: "static_pages#about", as: "about"
	get 'contact', to: "static_pages#contact", as: 'contact'
  
	resources :pickadates do
		post :rsvpstatus, :on => :collection
	end
	post "pickadates/invite_user", to: 'pickadates#invite_user', as: "invite_user"
	
	resources :users

	get "my_pickadates", to: 'users#my_pickadates', as: "my_pickadates"
	get "floor_pickadates", to: 'users#floor_pickadates', as: "floor_pickadates"
	get "invitations", to: 'users#invitations', as: "invitations" 
	
	resources :sessions, only: [:new, :create, :destroy]
  
	get 'signup', to: 'users#new', as: 'signup'
	get 'login', to: "sessions#new", as: 'login'
	delete 'logout', to: "sessions#destroy", as: 'logout'
  
  
  
  
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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
