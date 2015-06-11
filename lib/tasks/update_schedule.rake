namespace :schedule do
	desc "Update LoadSchedule table from API"
	task update: :environment do 
		ActiveRecord::Base.transaction do
			LoadSchedule.delete_all

			1.upto(16).each do |n|
				puts "Getting area #{n}..."
				response = Typhoeus.get "http://whereismypower.co.za/api/get_next_loadshedding?area=#{n}&stage=3B"
				results = JSON.parse(response.body)
				# @next_outage_arr << results["next_outage"]
				# @next_outage_period_arr << results["next_outage_period"]
				nxtout = results["next_outage"]
				nxtoutper = results["next_outage_period"]
				LoadSchedule.create! n, nxtout, nxtoutper
			end
		end
	end
end
