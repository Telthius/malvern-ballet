class DesignSystemController < ApplicationController
  before_action :ensure_development_environment
  
  def index
  end
  
  private
  
  def ensure_development_environment
    unless Rails.env.development?
      redirect_to root_path, alert: "Design System is only available in development."
    end
  end
end
