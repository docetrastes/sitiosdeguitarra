Sitiosdeguitarra::Application.routes.draw do
  scope :path_names => { :new => "crear", :edit => "editar" } do
    resources :sites, :path => "sitios"
    resource :session, :path => "sesion", :only => [ :new, :create, :destroy ]
  end
  
  match "/politicas-de-privacidad" => "static_pages#privacy_policy", :as => :privacy_policy
  root :to => "sites#index"
end
