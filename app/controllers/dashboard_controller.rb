class DashboardController < ApplicationController
  def index
    @disable_twitter_button = current_user.identities.any?{ |i| i[:provider] == "twitter"}
  end
end