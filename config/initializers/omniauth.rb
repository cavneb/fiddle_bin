raw_config = File.read("#{Rails.root}/config/omniauth.yml")
OMNIAUTH_CONFIG = YAML.load(raw_config)[Rails.env].symbolize_keys

OmniAuth.config.on_failure = OmniauthCallbacksController.action(:failure)

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, OMNIAUTH_CONFIG[:github_key], OMNIAUTH_CONFIG[:github_secret]
end
