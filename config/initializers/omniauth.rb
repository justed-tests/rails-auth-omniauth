Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['twitter_key'], ENV['twitter_secret']

  provider :facebook, ENV['facebook_key'], ENV['facebook_secret'],
           scope: 'public_profile', info_fields: 'id, name, link'

  # rename provider to google
  provider :google_oauth2, ENV['google_key'], ENV['google_secret'],
           scope: 'profile', image_aspect_ratio: 'square', image_size: 48,
           access_type: 'online', name: 'google'

  provider :linkedin, ENV['linkedin_key'], ENV['linkedin_secret'],
           scope: 'r_basicprofile',
           fields: ['id', 'first-name', 'last-name', 'location',
                    'picture-url', 'public-profile-url']

  OmniAuth.config.on_failure = proc do |env|
    SessionsController.action(:auth_failure).call(env)
  end
end
