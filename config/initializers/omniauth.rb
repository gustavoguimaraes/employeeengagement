Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV["TWITTER_KEY"], ENV["TWITTER_SECRET"]
  provider :facebook, ENV["FACEBOOK_ID"], ENV["FACEBOOK_SECRET"]
  provider :linkedin, ENV["LINKEDIN_KEY"], ENV["LINKEDIN_SECRET"]
end