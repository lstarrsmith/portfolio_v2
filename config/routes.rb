Rails.application.routes.draw do
  
  root 'welcome#index'

  post 'session' => 'session#create'
  delete 'session' => 'session#destroy'

  resources :admin
  resources :images
  resources :categories
  resources :projects

  namespace :admin do
    resources :projects do
      resources :categories do
        resources :images
      end
    end
  end

  #  resource :admin do
  #   resources :images
  #   resources :categories
  #   resources :projects

  # end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

#                   Prefix Verb   URI Pattern                                                                   Controller#Action
#                              root GET    /                                                                             welcome#index
#                           session POST   /session(.:format)                                                            session#create
#                                   DELETE /session(.:format)                                                            session#destroy
#                       admin_index GET    /admin(.:format)                                                              admin#index
#                                   POST   /admin(.:format)                                                              admin#create
#                         new_admin GET    /admin/new(.:format)                                                          admin#new
#                        edit_admin GET    /admin/:id/edit(.:format)                                                     admin#edit
#                             admin GET    /admin/:id(.:format)                                                          admin#show
#                                   PATCH  /admin/:id(.:format)                                                          admin#update
#                                   PUT    /admin/:id(.:format)                                                          admin#update
#                                   DELETE /admin/:id(.:format)                                                          admin#destroy
#                            images GET    /images(.:format)                                                             images#index
#                                   POST   /images(.:format)                                                             images#create
#                         new_image GET    /images/new(.:format)                                                         images#new
#                        edit_image GET    /images/:id/edit(.:format)                                                    images#edit
#                             image GET    /images/:id(.:format)                                                         images#show
#                                   PATCH  /images/:id(.:format)                                                         images#update
#                                   PUT    /images/:id(.:format)                                                         images#update
#                                   DELETE /images/:id(.:format)                                                         images#destroy
#                        categories GET    /categories(.:format)                                                         categories#index
#                                   POST   /categories(.:format)                                                         categories#create
#                      new_category GET    /categories/new(.:format)                                                     categories#new
#                     edit_category GET    /categories/:id/edit(.:format)                                                categories#edit
#                          category GET    /categories/:id(.:format)                                                     categories#show
#                                   PATCH  /categories/:id(.:format)                                                     categories#update
#                                   PUT    /categories/:id(.:format)                                                     categories#update
#                                   DELETE /categories/:id(.:format)                                                     categories#destroy
#                          projects GET    /projects(.:format)                                                           projects#index
#                                   POST   /projects(.:format)                                                           projects#create
#                       new_project GET    /projects/new(.:format)                                                       projects#new
#                      edit_project GET    /projects/:id/edit(.:format)                                                  projects#edit
#                           project GET    /projects/:id(.:format)                                                       projects#show
#                                   PATCH  /projects/:id(.:format)                                                       projects#update
#                                   PUT    /projects/:id(.:format)                                                       projects#update
#                                   DELETE /projects/:id(.:format)                                                       projects#destroy
#     admin_project_category_images GET    /admin/projects/:project_id/categories/:category_id/images(.:format)          admin/images#index
#                                   POST   /admin/projects/:project_id/categories/:category_id/images(.:format)          admin/images#create
#  new_admin_project_category_image GET    /admin/projects/:project_id/categories/:category_id/images/new(.:format)      admin/images#new
# edit_admin_project_category_image GET    /admin/projects/:project_id/categories/:category_id/images/:id/edit(.:format) admin/images#edit
#      admin_project_category_image GET    /admin/projects/:project_id/categories/:category_id/images/:id(.:format)      admin/images#show
#                                   PATCH  /admin/projects/:project_id/categories/:category_id/images/:id(.:format)      admin/images#update
#                                   PUT    /admin/projects/:project_id/categories/:category_id/images/:id(.:format)      admin/images#update
#                                   DELETE /admin/projects/:project_id/categories/:category_id/images/:id(.:format)      admin/images#destroy
#          admin_project_categories GET    /admin/projects/:project_id/categories(.:format)                              admin/categories#index
#                                   POST   /admin/projects/:project_id/categories(.:format)                              admin/categories#create
#        new_admin_project_category GET    /admin/projects/:project_id/categories/new(.:format)                          admin/categories#new
#       edit_admin_project_category GET    /admin/projects/:project_id/categories/:id/edit(.:format)                     admin/categories#edit
#            admin_project_category GET    /admin/projects/:project_id/categories/:id(.:format)                          admin/categories#show
#                                   PATCH  /admin/projects/:project_id/categories/:id(.:format)                          admin/categories#update
#                                   PUT    /admin/projects/:project_id/categories/:id(.:format)                          admin/categories#update
#                                   DELETE /admin/projects/:project_id/categories/:id(.:format)                          admin/categories#destroy
#                    admin_projects GET    /admin/projects(.:format)                                                     admin/projects#index
#                                   POST   /admin/projects(.:format)                                                     admin/projects#create
#                 new_admin_project GET    /admin/projects/new(.:format)                                                 admin/projects#new
#                edit_admin_project GET    /admin/projects/:id/edit(.:format)                                            admin/projects#edit
#                     admin_project GET    /admin/projects/:id(.:format)                                                 admin/projects#show
#                                   PATCH  /admin/projects/:id(.:format)                                                 admin/projects#update
#                                   PUT    /admin/projects/:id(.:format)                                                 admin/projects#update
#                                   DELETE /admin/projects/:id(.:format)                                                 admin/projects#destroy


#   # You can have the root of your site routed with "root"
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
