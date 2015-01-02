class CallbacksController < ApplicationController

  def twitter
    @social_media_id = Identity.find_auth(request.env["omniauth.auth"], current_user)
    if @social_media_id.persisted?
      redirect_to dashboard_path, flash: { notice: "Twitter has been connected to your account!" }
    else
      flash[:error] = "Sorry you made a mistake"
      redirect_to dashboard_path
    end
  end

  def facebook
    @social_media_id = Identity.find_auth(request.env["omniauth.auth"], current_user)
    if @social_media_id.persisted?
      redirect_to dashboard_path, flash: { notice: "Facebook has been connected to your account!" }
    else
      flash[:error] = "Sorry you made a mistake"
      redirect_to dashboard_path
    end
  end

end