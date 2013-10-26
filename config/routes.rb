Projectcomunal::Application.routes.draw do
  resources :securities

  resources :alumnos

  get "grupos/index"
  get "grupos/edit"
  get "grupos/show"
  get "prfinstuciones/index"
  get "prfinstuciones/edit"
  get "prfinstuciones/new"
  get "/inicio" => "home#index", :as => "home"
  get "/comunal" => "home#comunal", :as => "home_comunal"
  get "/profesor" => "home#profesor", :as => "home_profesor"
  get "/admin" => "home#admin", :as => "home_admin"
  get "/alumno" => "home#alumno", :as => "home_alumno"
  get "/elegir/:grupo/:id" => "grupos#elegir", :as => "elegir_proyecto"

  

  get "/confirmar/:codigo/:id" => "users#confirmar"

  get "/olvide" => "users#olvide",:as => "olvide"
  get "/recuperarcontrasena/:pass/:id" => "users#cambiar"
  post "enviarp" => "users#enviarc"
  post "/cambiarcontra/:pass/:id" => "users#cambiarcontra"


   resources :authentications do
    collection do
      delete "logout"
    end
  end

  resources :comunals do
    collection do
      resources :necesidades
    end
  end


  resources :grupos do
      collection do
        get "necesidades"
      end
  end



  resources :profesores do
    collection do
      get "grupos"
      get "ver/:id" => "profesores#ver", :as => "ver_proyecto"
      get "cambiar/:id" => "profesores#cambiar", :as => "cambiar_status"
      post "registrar/:id" => "profesores#registrar", :as => "registrar"
      get "aprobar/:id" => "profesores#aprobar", :as => "aprobar"
      get "reprobar/:id" => "profesores#reprobar", :as => "reprobar"
    end
  end

  resources :users

  resources :prfinstuciones
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'home#index'

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

  #api
  get "/api/profesor/:dni" => "api#profesor"
  get "/api/municipio/:id" => "api#municipio"
  get "/api/profesores/:id" => "api#profesores"
  post "/api/alumno/:id" => "api#alumno"
  get "/api/alumno/:id" => "api#alumno"
  get "/api/comunal/" => "api#comunal"
  get "/api/grupo/" => "api#grupo"
  get "/api/necesidades/" => "api#necesidades"

end
