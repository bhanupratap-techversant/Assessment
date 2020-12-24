class HealthService
  include Mongoid::Document

  field :ha, type: String
  field :service, type: String
  field :service_type, type: String
  field :m_20092010, type: Float
  field :f_20092010, type: Float
end
