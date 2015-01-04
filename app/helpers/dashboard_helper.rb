module DashboardHelper

  def disable_button(social_media_name)
    current_user.identities.any?{ |i| i[:provider] == social_media_name} if current_user
  end

end