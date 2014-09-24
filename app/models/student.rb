class Student < ActiveRecord::Base
	has_many :classrooms
	has_many :courses, through: :classrooms

	enum status: [ :idle, :enrolled ]
	validates :name, presence: true
	validates :register_number, uniqueness: true	
end
