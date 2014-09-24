class Course < ActiveRecord::Base
	has_many :classrooms, dependent: :destroy
	has_many :students, through: :classrooms

	accepts_nested_attributes_for :classrooms, :students

	enum status: [ :enrolling, :ongoing, :closed ]
	validates :name, presence: true
	validates :description, presence: true
	validates :status, presence: true
end
