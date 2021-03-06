Sitiosdeguitarra::Application.routes.draw do
  scope :path_names => { :new => "crear", :edit => "editar" } do
    resources :sites, :path => "sitios"
    resources :tags
    resources :feed_entries, :path => "articulos"
    resource :session, :path => "sesion", :only => [ :new, :create, :destroy ]
  end

  match "/politicas-de-privacidad" => "static_pages#privacy_policy", :as => :privacy_policy
  match "/mapa-del-sitio" => "static_pages#sitemap", :as => :sitemap
  match "/buscar" => "static_pages#search", :as => :search

  root :to => "static_pages#home"
end
