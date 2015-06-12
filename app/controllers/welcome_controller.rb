class WelcomeController < ApplicationController
	def index
		if current_user
			@load = LoadSchedule.find_by(:area_code => current_user.areacode)
		else
			@loads = LoadSchedule.all
		end
	end


	def sendtext
		account_sid = 'ACb428271e365dd1f356b4c76215b03b93'
		auth_token = '4dd873f1ead40ba3a2902918217ba51c'
		#@client = Twilio::REST::Client.new account_sid, auth_token
		from_num = '13127560601'
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
		redirect_to root_path
	end
end
