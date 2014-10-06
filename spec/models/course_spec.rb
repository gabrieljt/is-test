require 'rails_helper'

RSpec.describe Course, :type => :model do
  	#pending "add some examples to (or delete) #{__FILE__}"	
  	describe "#new"	do
  		it "fails save with default constructor" do
  			course = Course.new
  			expect(course.save).to eq(false)
  			expect(course.errors.count).to eq(3)
  			expect(course.errors.has_key?(:name)).to eq(true)
  			expect(course.errors.has_key?(:description)).to eq(true)
  			expect(course.errors.has_key?(:status)).to eq(true)
  			expect(course.name).to eq(nil)
  			expect(course.description).to eq(nil)
  			expect(course.status).to eq(nil)
  		end

  		it "succeeds save with assigned attributes" do
  			name = 'ORM'
  			description = 'Learn how to associate models like a boss.'
  			status = 0

  			course = Course.new(name: name, description: description, status: status)
  			expect(course.save).to eq(true)
  			expect(course.errors.blank?).to eq(true)
  			expect(course.name).to eq(name)
  			expect(course.description).to eq(description)
  			expect(course.enrolling?).to eq(true)
  		end

  		it "validates name uniqueness" do
  			name = 'ORM'
  			description = 'Learn how to associate models like a boss.'
  			status = 0

  			course1 = Course.new(name: name, description: description, status: status)
  			expect(course1.save).to eq(true)
  			
  			course2 = Course.new(name: name, description: description, status: status)
  			expect(course2.save).to eq(false)
  			expect(course2.errors.count).to eq(1)
  			expect(course2.errors.has_key?(:name)).to eq(true)
  		end
  	end
end