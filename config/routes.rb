Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    resources :positions
    mount VandalUi::Engine, at: "/vandal"
    mount GraphitiGraphQL::Engine, at: "/gql"
  end
end
