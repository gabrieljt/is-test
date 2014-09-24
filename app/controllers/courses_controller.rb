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
			#params[:student_].each do |s|
			#	@student = Student.find(@s)
			#	@course.classrooms.create(student: @student, entry_at: Time.zone.now)
			#end
			redirect_to @course
		else
			render 'new'
		end
	end

	def edit
		@course = Course.find(params[:id])
		@statuses = Course.statuses
	end

	def update
		@course = Course.find(params[:id])
		@statuses = Course.statuses

		if @course.update(course_params)			
			redirect_to @course
		else
			render 'edit'
		end
	end

	def destroy
		@course = Course.find(params[:id])
		@course.destroy

		redirect_to courses_path
	end

	private 
		def course_params
			params.require(:course).permit(:name, :description, :status, :student_ids => [])
		end
end