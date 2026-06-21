class AdminController < ApplicationController
  before_action :authenticate_admin!

  private



  def authenticate_admin!
    unless current_user&.admin?
    redirect_to root_path, alert: "Not authorized to access admin panel"
    end
  end
end
