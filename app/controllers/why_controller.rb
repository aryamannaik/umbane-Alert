class WhyController < ApplicationController
	def index
		@why_information = "What is load shedding?
Load shedding is the term for when areas lose access to power for a predetermined 
duration of time. Due to the growing South African economy and increased demand 
for electricity the Eskom power stations do not have the capacity to meet this 
demand. Therefore, the load shedding times are planned as a way to throttle the 
load and share the available electricity among all customers. It is a measure of last 
resort to prevent the collapse of the power system, which would leave everyone 
without power for an extended period. 

Why is it important?
When load shedding occurs, people electrical supply is shut off and they cannot use 
their Electric geyser microwave ovens, refrigerators, lights, and TV. Since load 
shedding was instituted in January of 2008, many people have accepted it as a 
routine part of life and plan around it. There are many mobile apps that notify users 
when load shedding is going to occur in their area. However, many residents of 
Townships and low-income areas do not own smartphones. And those that do own 
them do not know how to utilize them to find out this information. Thus they are 
taken by surprise when load shedding occurs and do not plan in preparation, that is 
where we come in."
	end
end