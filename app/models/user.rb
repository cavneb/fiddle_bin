class User < ActiveRecord::Base

  # class methods .............................................................
  class << self
    def from_omniauth(auth)
      where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
    end

    def create_from_omniauth(auth)
      create! do |user|
        user.provider   = auth["provider"]
        user.uid        = auth["uid"]
        user.email      = auth["info"]["email"]
        user.name       = auth["info"]["name"]
        user.avatar_url = auth["info"]["image"]
      end
    end
  end

  # public instance methods ...................................................
  def track_login(ip_address)
    update_attributes({
      sign_in_count:      ((sign_in_count || 0) + 1),
      last_sign_in_at:    current_sign_in_at,
      current_sign_in_at: Time.now,
      last_sign_in_ip:    current_sign_in_ip,
      current_sign_in_ip: ip_address
    })
  end

  # camelcased for ember
  def as_json
    {
      id: self.id,
      name: self.name,
      email: self.email,
      avatarUrl: self.avatar_url
    }
  end

end

