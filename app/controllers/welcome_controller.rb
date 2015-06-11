class WelcomeController < ApplicationController
	account_sid = 'ACcc25a6efd339b0a50ad3e05051cc6187'
	auth_token = '385586a05a54de87e704504dfbff1e11'
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
	def sendtext
		@client = Twilio::REST::Client.new account_sid, auth_token
		from = '+15005550006'

		@users.each do |user|
			client.account.messages.create(
			:from => from,
			:to => user.phonenum,
			:body => "Next Outage at: #{@next_outage[user.areacode]}\nNext Outage duration: #{next_outage_period[user.areacode]}")
		end
	end
	helper_method :sendtext

end
