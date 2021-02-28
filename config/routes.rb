Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    resources :positions
    mount VandalUi::Engine, at: '/vandal'
    # your routes go here
    scope defaults: { format: :html } do
      mount GraphitiGraphQL::Engine, at: "/gql"
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
