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

  def self.to_csv
    header_attributes = ["Dimension" ,"HA 1 Interior", "HA 2 Fraser", "HA 3 Vancouver Caustal", "HA 4 Vancouver Island", "HA 5 Northern"]
    attributes = self.fields.except("_id").keys

    CSV.generate(headers: true) do |csv|
      csv << header_attributes

      all.each do |ps|
        csv << ps.attributes.values_at(*attributes)
      end

      csv <<  attributes.map do |attribute|
        attribute == "dimension" ? "Grand Total" : all.sum(attribute)
      end
    end
  end
end
