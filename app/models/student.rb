class Student < ActiveRecord::Base
	has_many :classrooms
	has_many :courses, through: :classrooms

	accepts_nested_attributes_for :classrooms, :courses

	before_save :update_status

	enum status: [ :idle, :enrolled ]
	validates :name, presence: true
	validates :register_number, uniqueness: true	

	private
		def update_status
			self.courses.any? ? self.status = Student.statuses[:enrolled] : self.status = Student.statuses[:idle]
		end		
end
