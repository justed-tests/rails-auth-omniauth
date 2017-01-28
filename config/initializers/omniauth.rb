Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['twitter_key'], ENV['twitter_secret']
  provider :facebook, ENV['facebook_key'], ENV['facebook_secret'],
           scope: 'public_profile', info_fields: 'id, name, link'
end
