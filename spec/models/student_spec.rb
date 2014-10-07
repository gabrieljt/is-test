require 'rails_helper'

RSpec.describe Student, :type => :model do
	name = 'John Doe'
	Student.create(name: name)

  	describe '#new'	do
  		context 'when default constructor' do
	  		student = Student.new

			it 'is not valid' do
				expect(student.valid?).to be_falsey
			end

			it 'has 1 error' do
  				expect(student.errors.count).to eq(1)
			end

			it 'is not valid without :name' do
	  			expect(student.errors).to have_key(:name)
			end

			it 'is valid without :register_number' do
	  			expect(student.errors).not_to have_key(:register_number)
			end

			it 'is valid without :status' do
	  			expect(student.errors).not_to have_key(:status)
			end

			it 'cannot be saved' do
  				expect(student.save).to be_falsey
  			end
		end

		context 'when :name' do
			student = Student.new(name: name)

  			it 'is valid' do
  				expect(student.valid?).to be_truthy  				
  			end

  			it 'has 0 errors' do
  				expect(student.errors.count).to be_zero
  			end

  			it 'can be saved' do
  				expect(student.save).to be_truthy
  			end

  			it 'generates :register_number' do
  				student = Student.new(name: name)
  				expect{ student.save }.to change{ student.register_number }
  			end

  			it 'generates :status' do
  				student = Student.new(name: name)
  				expect{ student.save }.to change{ student.status }
  			end
  		end  		
  	end
end
