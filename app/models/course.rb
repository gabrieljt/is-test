class Course < ActiveRecord::Base
	enum status: [ :enrolling, :ongoing, :closed ]
	validates :name, presence: true
	validates :description, presence: true
	validates :status, presence: true
end
