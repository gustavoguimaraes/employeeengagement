class UsersDashboardController < ApplicationController

  include DashboardHelper

  def index
    redirect_to admin_dashboard_path if current_admin_user
  end
end