FACEBOOK_CONFIG = YAML.load(ERB.new(File.read("#{Rails.root}/config/facebook.yml")).result)[Rails.env]

Rails.application.config.middleware.use OmniAuth::Builder do
  puts "#{FACEBOOK_CONFIG['APP_ID']} #{FACEBOOK_CONFIG['APP_SECRECT']}"
  provider :facebook, FACEBOOK_CONFIG["APP_ID"], FACEBOOK_CONFIG["APP_SECRET"], {:client_options => {:ssl => {:verify => false}}}
end