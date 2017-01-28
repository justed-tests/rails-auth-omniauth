# user lives here
class User < ApplicationRecord
  class << self
    def from_omniauth(auth_hash)
      user = find_or_create_by(uid: auth_hash['uid'],
                               provider: auth_hash['provider'])

      user.assign_oauth_attrs(auth_hash['info'])
      user.save!
      user
    end
  end

  def assign_oauth_attrs(params = {})
    self.name = params['name']
    self.location = oauth_location_for provider, params['location']
    self.image_url = params['image']

    self.url = oauth_url_for provider, params['urls']
  end

  private

  def oauth_location_for(provider, hash)
    case provider
    when 'linkedin' then hash['name']
    else hash
    end
  end

  def oauth_url_for(provider, hash)
    case provider
    when 'linkedin' then hash['public_profile']
    else
      if hash
        hash[provider.capitalize]
      else
        ''
      end
    end
  end
end
