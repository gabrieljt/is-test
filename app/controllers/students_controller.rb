class StudentsController < ApplicationController
	def index
		@students = Student.all
	end

	def show
		@student = Student.find(params[:id])
	end

	def new
		@student = Student.new
	end

	def create
		@student = Student.new(student_params)

		if @student.save
			redirect_to @student
		else
			render 'new'
		end
	end

	def edit
		@student = Student.find(params[:id])
	end

	def update
		@student = Student.find(params[:id])

		# Avoids deleting ongoing and closed courses, which are not shown in the selection.
		# There must be a better way to do this...		
		@student.classrooms.each do |classroom|
			if classroom.course.ongoing? || classroom.course.closed?
				params[:student][:course_ids].push(classroom.course_id)
			end
		end		

		if @student.update(student_params)			
			redirect_to @student
		else
			render 'edit'
		end
	end

	def destroy
		@student = Student.find(params[:id])
		@student.destroy

		redirect_to students_path
	end

	private 
		def student_params
			params.require(:student).permit(:name, :course_ids => [])
		end	
end
