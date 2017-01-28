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
    self.location = params['location']
    self.image_url = params['image']

    self.url = if params['urls']
                 params['urls'][provider.capitalize]
               else
                 ''
               end
  end
end
