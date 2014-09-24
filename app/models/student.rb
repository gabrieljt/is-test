class Student < ActiveRecord::Base
	has_many :classrooms
	has_many :courses, through: :classrooms

	accepts_nested_attributes_for :classrooms, :courses

	before_create :generate_register_number
	before_save :update_status

	enum status: [ :idle, :enrolled ]
	validates :name, presence: true
	validates :register_number, uniqueness: true	

	private
		def generate_register_number
			# Ensures that generated register number doesn't exists.
			@register_number = rand.to_s[2..11]
			while Student.find_by(register_number: @register_number)
				@register_number = rand.to_s[2..11]
			end	
			self.register_number = @register_number
		end

		def update_status
			@enrolled = false
			self.courses.each do |course|
				if course.enrolling? || course.ongoing?
					@enrolled = true
				end
			end

			@enrolled ? self.status = Student.statuses[:enrolled] : self.status = Student.statuses[:idle]
		end		
end
