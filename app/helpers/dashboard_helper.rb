module DashboardHelper

  def disable_button(social_media_name)
    current_user.identities.any?{ |i| i[:provider] == social_media_name} if current_user
  end

  def format_url(url)
    match_http = url =~ /^http(s)?:\/\//i
    return url if  match_http == 0
    "http://" + url
  end

end