require 'facebook_hidden'

h = Hidden.new();
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, h.app_ID, h.app_Secret
end