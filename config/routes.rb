Mapsndata::Application.routes.draw do

  # do home, help & sitemap as, logically enough, maps
  get '/', to: redirect('/maps/home')
  get '/home', to: redirect('/maps/home')
  get '/help', to: redirect('/maps/help')
  get '/sitemap', to: redirect('/maps/sitemap')

  # avoid treating 'new' as the name of a map, put above maps/name
  get '/maps/new', to: 'maps#new'

  get '/maps/:name', to: 'maps#named_map', constraints: { name: /[A-Za-z][A-Za-z0-9_]*/ }

  resources :maps do
    collection do
      get :named_maps
    end
  end

  devise_for :users

  devise_scope :user do
    get 'sign_up', :to => 'devise/registrations#new'
    get 'sign_in', :to => 'devise/sessions#new'
    delete 'sign_out', :to => 'devise/sessions#destroy'
    get 'sign_out', :to => 'devise/sessions#destroy'
    get 'reset_password', :to => 'devise/passwords#new'
    # get 'change_password', :to => 'devise/passwords#edit' # change_passwords is an interior form, not useful without a token
    get 'settings', :to => 'devise/registrations#edit'
  end

  resources :users

  get "static_pages/about"
  get "static_pages/contact"

  # direct routes
  match '/about', to: 'static_pages#about', via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'

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

  # switch root to be the "home" map, when it's ready
  root :to => "maps#home"

end
