# Load the Rails application.
require_relative 'application'

require 'yaml'
require 'omniauth'
require 'omniauth-facebook'
require 'koala'

# Initialize the Rails application.
Rails.application.initialize!


APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

env_config = YAML.load_file(APP_ROOT.join('config', 'facebook.yml'))
env_config.each do |key, value|
ENV[key] = value
end

def facebook_permissions
  ["publish_actions","public_profile","user_friends","user_about_me","user_posts","read_custom_friendlists","user_likes"]
# Aquí van los permisos de tu aplicación, fíjate en qué formato tienen que ir.
end
use OmniAuth::Builder do
provider :facebook, ENV['APP_ID'], ENV['SECRET'],
         :scope => facebook_permissions
end
