require 'api_constraints'

Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
    end
  end
end
