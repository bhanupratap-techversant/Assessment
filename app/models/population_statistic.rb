class PopulationStatistic
  include Mongoid::Document

  field :dimension, type: String
  field :ha1_interior, type: Float
  field :ha2_fraser, type: Float
  field :ha3_vancouver_caustal, type: Float
  field :ha4_vancouver_island, type: Float
  field :ha5_northern, type: Float

  scope :filter_by, -> (params) { where(params) if params.present? }
  scope :ordered, -> (params) { order("#{params[:sort]} #{params[:direction]}") if params.present? && fields.keys.include?(params[:sort]) }
end
