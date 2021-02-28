class PositionResource < ApplicationResource
  federated_type("Department").has_many :positions
  federated_type("Employee").has_many :positions
  federated_belongs_to :department
  federated_belongs_to :employee

  attribute :title, :string
  attribute :active, :boolean
  attribute :historical_index, :integer

  # for microservices not graphiti, maybe graphql: false
  belongs_to :employee, remote: "http://localhost:3000/api/v1/employees"
  belongs_to :department, remote: "http://localhost:3002/api/v1/departments"
  attribute :employee_id, :integer, only: [:filterable]
  attribute :department_id, :integer, only: [:readable, :filterable]
end
