class HealthService
  include Mongoid::Document

  field :ha, type: String
  field :service, type: String
  field :service_type, type: String
  field :m_20092010, type: Float
  field :f_20092010, type: Float

  # TODO: We can create concern for duplicate code.
  scope :filter_by, -> (params) { where(params) if params.present? }
  scope :ordered, -> (params) { order("#{params[:sort]} #{params[:direction]}") if params.present? && fields.keys.include?(params[:sort]) }

  def self.to_csv
    header_attributes = ["HA" ,"SERVICE", "SERVICE TYPE", "M_20092010", "F_20092010"]
    attributes = self.fields.except("_id").keys

    CSV.generate(headers: true) do |csv|
      csv << header_attributes

      all.each do |ps|
        csv << ps.attributes.values_at(*attributes)
      end

      csv <<  ["Grand Total", "", "", all.sum("m_20092010"), all.sum("f_20092010")]
    end
  end
end
