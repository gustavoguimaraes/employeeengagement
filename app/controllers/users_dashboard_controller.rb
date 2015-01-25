class UsersDashboardController < ApplicationController

  include DashboardHelper

  def index
    redirect_to admin_dashboard_path if current_admin_user
    @user_posts = Post.order(created_at: :desc)
  end
end