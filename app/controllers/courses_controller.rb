class CoursesController < ApplicationController
	def index
		@courses = Course.all
	end

	def show
		@course = Course.find(params[:id])
	end

	def new
		@course = Course.new
		@statuses = Course.statuses
	end

	def create
		@course = Course.new(course_params)
		@statuses = Course.statuses
		if @course.save
			redirect_to @course
		else
			render 'new'
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private 
		def course_params
			params.require(:course).permit(:name, :description, :status)
		end
end