require 'rails_helper'

RSpec.describe Course, :type => :model do
	name = 'foo'
	description = 'bar'
	status = 0
	Course.create(name: name, description: description, status: status)

  	describe '#new'	do
  		context 'when default constructor' do
	  		course = Course.new

			it 'is not valid' do
				expect(course.valid?).to be_falsey
			end

			it 'has 3 errors' do
  				expect(course.errors.count).to eq(3)
			end

			it 'is not valid without :name' do
	  			expect(course.errors).to have_key(:name)
			end

			it 'is not valid without :description' do
	  			expect(course.errors).to have_key(:description)
			end

			it 'is not valid without :status' do
	  			expect(course.errors).to have_key(:status)
			end

			it 'cannot be saved' do
  				expect(course.save).to be_falsey
  			end
		end

		context 'when :name, :description, :status' do
			course = Course.new(name: 'ORM', description: 'Learn how to associate models like a boss.', status: 0)

  			it 'is valid' do
  				expect(course.valid?).to be_truthy  				
  			end

  			it 'has 0 errors' do
  				expect(course.errors.count).to be_zero
  			end

  			it 'can be saved' do
  				expect(course.save).to be_truthy
  			end
  		end

  		context 'when :name is duplicated' do
			course = Course.new(name: name, description: description, status: status)

			it 'is not valid' do
				expect(course.valid?).to be_falsey
			end

			it 'has :name error' do
				expect(course.errors).to have_key(:name)
			end

			it 'cannot be saved' do
				expect(course.save).to be_falsey
			end
		end
  	end
end