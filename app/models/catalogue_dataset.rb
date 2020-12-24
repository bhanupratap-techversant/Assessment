class CatalogueDataset
  include Mongoid::Document

  field :resource_id, type: String
  field :url, type: String

  has_many :population_statistics, dependent: :destroy
  has_many :health_services, dependent: :destroy
end
