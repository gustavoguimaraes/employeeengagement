class UsersDashboardController < ApplicationController
  before_filter :authenticate_user!
  include DashboardHelper

  def index
    redirect_to admin_dashboard_path if current_admin_user
    @user_posts = Post.where.not(state: Post.states[:rejected]).order(created_at: :desc)
  	if current_user.role == "company_admin"
  		@user_posts = Post.where(state: Post.states[:pending]).order(created_at: :desc)
  	else
  		@user_posts = Post.where(state: Post.states[:approved]).order(created_at: :desc)
 		end
	end
end