class AdminsController < ApplicationController
	def index
	end
	before_action :authenticate
	def authenticate
    authenticate_or_request_with_http_basic('Administration') do |username, password|
      username == 'daniel' && password == 'lowistheman2'
    end
  end
end


