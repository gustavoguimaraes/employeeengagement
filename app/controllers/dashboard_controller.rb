class DashboardController < ApplicationController
  def index
    @sanity_test = "This is the Dashboard Bitches!"
    @user_company = current_user.company.name
  end
end