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

		# Ensures that generated register number doesn't exists.
		@register_number = rand.to_s[2..11]
		while Student.find_by(register_number: @register_number)
			@register_number = rand.to_s[2..11]
		end	
		@student.register_number = @register_number
		@student.status = Student.statuses[:idle]

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
			params.require(:student).permit(:name)
		end	
end
