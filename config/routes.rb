require 'api_constraints'

Rails.application.routes.draw do
  scope module: :api, default: { format: :json } do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :categories, only: %i[create index update]
    end
  end
end
