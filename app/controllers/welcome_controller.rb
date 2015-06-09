class WelcomeController < ApplicationController
  def index
  	if current_user
	  	response = Typhoeus.get "http://whereismypower.co.za/api/get_next_loadshedding?area=#{current_user.areacode}&stage=3B"
	  	results = JSON.parse(response.body)
	  	@next_outage = results["next_outage"]
	  	@next_outage_period = results["next_outage_period"]
		else
			@next_outage = []
			@next_outage_period = []

			1.upto(16).each do |n|
				response = Typhoeus.get "http://whereismypower.co.za/api/get_next_loadshedding?area=#{n}&stage=3B"
				results = JSON.parse(response.body)
				@next_outage << results["next_outage"]
				@next_outage_period << results["next_outage_period"]
			end
		end
  end
end
