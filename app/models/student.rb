class Student < ActiveRecord::Base
	enum status: [ :idle, :enrolled ]
	validates :name, presence: true
	validates :register_number, uniqueness: true	
end
