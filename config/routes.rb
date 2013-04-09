Sodes::Application.routes.draw do
  resources :users do
    resources :tasks do
    end
  end
  resources :users do
    resources :projects do
      resources :tasks
      resources :journals
    end
  end 
  resources :users do
    resources :journals do
    end
  end
  

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  #NAMED ROUTES:
  #match 'users/:username' => 'users#show', :as => 'single_user'

  #match 'users/:username/projects' => 'projects#index', :as => 'user_projects_index'
  #match 'users/:username/projects/new' => 'projects#new', :as => 'user_projects_new'

  #match 'users/:username/journals' => 'journals#index', :as => 'user_journals_index'
  #match 'users/:username/journals/new' => 'journals#new', :as => 'user_journals_new'

  #match 'users/:username/tasks' => 'tasks#index', :as => 'user_tasks_index'
  #match 'users/:username/tasks/new' => 'tasks#new', :as => 'user_tasks_new'

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
root :to => 'users#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
