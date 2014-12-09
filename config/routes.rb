Rails.application.routes.draw do

  devise_for :users
  resources :users do

    member do
      get :edit1
      get :edit2
      get :edit3
    end

    resources :experiences, :controller => 'user_experiences'
    resources :educations, :controller => 'user_educations'
  end

  resources :jobs do
    collection do
      get :following
      get :posting
    end

    member do
      get :edit1
      get :edit2
      get :edit3

      get :follower
      patch :hide
    end

    resources :follows, :controller => 'job_follows'
    resources :comments, :controller => 'job_comments'
    resources :submissions, :controller => 'job_submissions' do
      member do
        patch :admit
        patch :reject
        patch :confirm
        patch :decline
        patch :emphasize
        patch :refuse
      end
    end
  end

  root 'jobs#index'
  get 'locations/:location', to: 'jobs#index', as: "location"
  get 'countries/:country', to: 'jobs#index', as: "country"
  get 'professions/:profession', to: 'jobs#index', as: "profession"
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
