class UserController < ApplicationController
	def home
	end
	def facebook
  		@facebook ||= Koala::Facebook::API.new(oauth_token)
	end
end
