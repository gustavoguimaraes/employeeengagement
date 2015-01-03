class CallbacksController < ApplicationController

  def connect_social_media
    social_media_name = request.env["omniauth.auth"][:provider].capitalize
    @social_media_id = Identity.find_auth(request.env["omniauth.auth"], current_user)
    if @social_media_id.persisted?
      redirect_to dashboard_path, flash: { notice: "#{social_media_name} has been connected to your account!" }
    else
      flash[:error] = "Sorry a mistake happened"
      redirect_to dashboard_path
    end
  end

end