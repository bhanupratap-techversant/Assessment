module ApplicationHelper
  def sortable(column_name, title=nil)
    title ||= column_name.to_s.titleize
    direction = params[:direction] == "asc" ? "desc" : "asc"
    sortable_params = request.parameters.merge(sort: column_name, direction: direction)

    link_to title, url_for(sortable_params)
  end
end
