module OauthMocking
  def login_with_oauth(provider = :github)
    visit "/auth/#{provider}"
  end
end
