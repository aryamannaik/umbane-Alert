class WelcomeController < ApplicationController
	def index
		if current_user
			@load = LoadSchedule.find_by(:area_code => current_user.areacode)
		else
			@loads = LoadSchedule.all
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
			load = LoadSchedule.find_by(:area_code => user.areacode)
			@client.account.messages.create(
			:from => from_num,
			:to => user.phonenum,
			:body => "Next Outage at: #{load.next_outage}\nNext Outage duration: #{load.next_outage_period}")
		end
		redirect_to welcome_index_path
	end
end
