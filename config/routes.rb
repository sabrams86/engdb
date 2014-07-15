Engdb::Application.routes.draw do

  resources :gages


  # This line mounts Forem's routes at /forums by default.
  # This means, any requests to the /forums URL of your application will go to Forem::ForumsController#index.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Forem relies on it being the default of "forem"
  mount Forem::Engine, :at => '/forums'

  resources :product_bulletins

  resources :treqs

  resources :engineering_procedures

  resources :engineering_projects

  resources :request_items

  resources :requests

  resources :email_lists

get 'home' => 'home#index'
get 'logout' => 'sessions#destroy'
get 'login' => 'sessions#new'
post 'login' => 'sessions#create'
delete 'logout' => 'sessions#destroy'

  get "login/index"

  get "sessions/new"

  get "sessions/create"

  get "sessions/destroy"

  resources :users

  get "home/index"
  
  get '/home', to: 'home#index', as: 'home'

  
  resources :ecns do
    resources :revisions
  end

  resources :revisions
  match '/drawings/new', to: 'drawings#new', as: 'new_drawing'
  match '/drawings/newe', to: 'drawings#new_e_drawing', as: 'new_e_drawing'
  match '/drawings/newrd', to: 'drawings#new_rd_drawing', as: 'new_rd_drawing'
  match '/drawings/newwp', to: 'drawings#new_wp_drawing', as: 'new_wp_drawing'

  resources :drawings do
    resources :revisions
    
  end
  
  resources :home
  

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

 match 'ecns/submit' => 'ecns#submit'
 match 'ecns/close' => 'ecns#close'
 
 match 'requests/submit_eng' => 'requests#submit_eng'
 match 'requests/index_open' => 'requests#index_open'
 match 'requests/submit_mfg' => 'requests#submit_mfg'
 match 'requests/submit_acct' => 'requests#submit_acct'
 match 'requests/submit_sales' => 'requests#submit_sales'
 match 'requests/submit_sor' => 'requests#submit_sor'
 match 'requests/reject' => 'requests#reject'
 match 'requests/close_sir' => 'requests#close_sir'
 
 match 'drawings/view' => 'drawings#view'
 
 match '*path' => redirect('/home'), via: :get
 
 get '/users/sign_in', :to => "users#sign_in"


  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
    root :to => 'sessions#new'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
