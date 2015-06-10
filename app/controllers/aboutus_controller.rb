class AboutusController < ApplicationController
	def index
		@our_information = "The Problem

We embarked on our adventure to South Africa on a mission.  We wanted to learn 
how to code and then to utilize those skills to make a positive impact on the South 
African community.  During our very first night out to dinner as a group we were 
informed that we had to get our orders in before 8pm because that is when load 
shedding would occur and the restaurant would lose power. We were stunned and 
confused. What is load shedding? How could a whole area lose power and everyone 
just treats it as routine? This was admittedly a very first world approach to this 
serious issue. The head of our program would tell us when load shedding was and 
we would plan accordingly by charging our computers and getting dinner 
beforehand. We soon adjusted to this routine and thought that was the end of the 
story. However, when we visited the Khayelitsha Township and spoke to several of 
its residents they enlightened us to a troubling reality: many of them did not have 
regular access to smartphones or computers and thus did not have access to load 
shedding alerts. When load shedding affected their area, they were caught 
completely off guard. The power would just go off and they had no certainty of when 
they would turn back on. Load shedding is an inconvenience to most people but it is 
debilitating to residents of Townships. In response, we decided to utilize our 
newfound skills to help mitigate a very real issue for them. Our premise is very 
simple: instead of receiving an alert in the form of a mobile app, we disseminate our 
alerts through SMS. 

Our Solution

We devised our App with our target demographic in mind and thus set out to make 
it as simple to use as possible. Although residents of townships do not have 
convenient access to web-enabled devices, they do own cellphones and regularly 
text. Our solution targets their normal interactions with technology notifying them 
via SMS. Signing up is the only portion of our process that requires access to a web-
enabled device such as a smartphone or computer. The members of the Khayelitsha 
Township informed us that there are several communal computers for people to use 
and that there are enough people who own a smartphone to make this method 
viable. Once members sign up with their phone number, password, and area 
number, they will automatically begin receiving text alerts for their area. While 
logged in to our site, they will also be able to view this information on our 
homepage. Even if a user is not logged in, anyone can visit our site and view 
upcoming load shedding information for all areas. 

How it Works?

We gather the time, location, and duration of each load shedding occurrence by 
utilizing the electrical companies’ APIs. API is what allows an app to interact with 
another website. Think of how Google Maps is embedded on other websites. It is an 
easy open source way for apps to share data. We then deploy Twilio to send out the 
text messages to everyone who signs up for our service. Twilio allows us to send 
messages through their API, which costs significantly less than standard texting 
services."
	end
end