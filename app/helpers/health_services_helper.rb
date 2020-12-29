module HealthServicesHelper
  def select_options_for_ha
    ha_list = HealthService.pluck(:ha).uniq.map {|ha| ha.truncate(100)}
    ha_list.unshift("")
    options_for_select(ha_list, params.dig(:filter, :ha))
  end
end
