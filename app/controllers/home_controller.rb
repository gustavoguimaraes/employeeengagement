class HomeController < ApplicationController
  def index
    return redirect_to dashboard_path if user_signed_in?
    redirect_to new_user_registration_path
  end
end
