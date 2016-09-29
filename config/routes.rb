Rails.application.routes.draw do
  resources :works

  get 'companies/' => 'companies#index'
  get 'companies/workers/:id' => 'companies#worker'
  get 'companies/workers/:id/rating' => 'companies#workerrating'
  post 'companies/workers/:id/addrating' => 'companies#addworkerrating'
  get 'companies/workers'
  get 'companies/workers_new/:id' => 'companies#addworker', as: :workers_new
  get 'companies/work_data/:id' => 'companies#work_data', as: :work_data

  post  'companies/search'

  # resources :companies, :usercompanies do
  #   resources :users, :works
  # end

  resources :companies do
    resources :works, only: [:index]
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  
  resources :users do
    resources :works, only: [:index] #, path_names: { index: 'index2' }
    #map.resources :works, :path_names => { :index => 'index2' }
  end

  get 'users/' => 'users#index'
  get 'users/workers_new/:id' => 'users#addworker', as: :workers_new2
  get 'users/workers/:id' => 'users#worker'
  get 'users/workers/:id/rating' => 'users#workerrating'
  post 'users/workers/:id/addrating' => 'users#addworkerrating'
  get 'users/workers'
  post  'users/search'


  # resources :type, only: [] do
  #   resources :templates, only: [] do
  #       resources :categories, only: [:index]
  #   end
  # end

  root  'home#index'
  post  'home/create_user_companies'


  devise_for :usercompanies, controllers: {
    sessions: 'usercompanies/sessions',
    registrations: 'usercompanies/registrations',
    passwords: "usercompanies/passwords"
  }

  resources :usercompanies, only: [:edit, :update]

  #get 'usercompanies/edit'

  #get 'usercompanies/update'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

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
