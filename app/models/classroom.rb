class Classroom < ActiveRecord::Base
	belongs_to :course
	belongs_to :student

	before_save :update_student_status
	after_destroy :update_student_status

	private 
		def update_student_status
			@enrolled = false
			self.student.courses.each do |course|
				if course.enrolling? || course.ongoing?
					@enrolled = true
				end
			end

			@enrolled ? self.student.status = Student.statuses[:enrolled] : self.student.status = Student.statuses[:idle]
			self.student.save
		end		
end