class WelcomeController < ApplicationController
	def index
		if current_user
			@load = LoadSchedule.find(:area_code => user.areacode)
		else
			@loads = LoadSchedule.all
		end

		# REMOVE THSI WHEN YOU ARE DONE
		if current_user
			response = Typhoeus.get "http://whereismypower.co.za/api/get_next_loadshedding?area=#{current_user.areacode}&stage=3B"
			LoadSchedule.
			results = JSON.parse(response.body)
			@next_outage = results["next_outage"]
			@next_outage_period = results["next_outage_period"]
		else
			@next_outage_arr = []
			@next_outage_period_arr = []
			1.upto(16).each do |n|
				response = Typhoeus.get "http://whereismypower.co.za/api/get_next_loadshedding?area=#{n}&stage=3B"
				results = JSON.parse(response.body)
				@next_outage_arr << results["next_outage"]
				@next_outage_period_arr << results["next_outage_period"]
			end
		end
	end


	def sendtext
		account_sid = 'ACcc25a6efd339b0a50ad3e05051cc6187'
		auth_token = '385586a05a54de87e704504dfbff1e11'
		#@client = Twilio::REST::Client.new account_sid, auth_token
		from_num = '+15005550006'
		@users = User.all
		Twilio.configure do |config|
    	config.account_sid = account_sid
  	  config.auth_token = auth_token
	  end
    @client = Twilio::REST::Client.new

		@users.each do |user|
			load = LoadSchedule.find(area_code: user.areacode)
			@client.account.messages.create(
			:from => from_num,
			:to => user.phonenum,
			:body => "Next Outage at: #{load.next_outage}\nNext Outage duration: #{load.next_outage_period}")
		end
	end
	helper_method :sendtext
end
