class Student < ActiveRecord::Base
	enum status: [ :idle, :enrolled ]
	validates :name, presence: true
	validates :register_number, presence: true, uniqueness: true
	validates :status, presence: true
end
