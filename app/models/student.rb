class Student < ActiveRecord::Base
	has_many :classrooms
	has_many :courses, through: :classrooms

	accepts_nested_attributes_for :classrooms, :courses

	enum status: [ :idle, :enrolled ]
	validates :name, presence: true
	validates :register_number, uniqueness: true	
end
