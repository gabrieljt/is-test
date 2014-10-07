require 'rails_helper'

RSpec.describe Classroom, :type => :model do
	course_name = 'Foo'
	student_name = 'John Doe'
	Course.create(name: course_name, description: 'Bar', status: 0)
	Student.create(name: student_name)

	describe '#new' do
		context 'when default constructor' do
			classroom = Classroom.new

			it 'is not valid' do
				expect(classroom.valid?).to be_falsey
			end

			it 'has 2 errors' do
  				expect(classroom.errors.count).to eq(2)
			end

			it 'is not valid without :course' do
	  			expect(classroom.errors).to have_key(:course)
			end

			it 'is not valid without :student' do
	  			expect(classroom.errors).to have_key(:student)
			end

			it 'cannot be saved' do
  				expect(classroom.save).to be_falsey
  			end
		end

		context 'when Course adds Student' do
			course = Course.find_by(name: course_name)			
			student = Student.find_by(name: student_name)
			course.students.create(student.attributes)

			it 'is saved' do
				expect(course.students).not_to be_empty
			end
		end
	end
end
