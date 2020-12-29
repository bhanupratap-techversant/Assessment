class ApplicationController < ActionController::Base
  helper_method :sort_direction

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end
end
