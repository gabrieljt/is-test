class WelcomeController < ApplicationController
	def index
		@courses = Course.where("status = ?", Course.statuses[:enrolling])
	end
end
