require 'rails_helper'

RSpec.describe Classroom, :type => :model do
	course_name = 'Foo'
	student_name = 'John Doe'
	Course.create(name: course_name, description: 'Bar', status: 0)
	Student.create(name: student_name)
	Classroom.create(course_id: 1, student_id: 1)

	describe '#new' do
		context 'when :course, :student' do
			course = Course.new(name: 'ORM', description: 'Learn how to associate models like a boss.', status: 0)
			student = Student.new(name: 'Foo')
			classroom = Classroom.new(course: course, student: student)
			
			it 'is valid' do
  				expect(classroom.valid?).to be_truthy  				
  			end

  			it 'has 0 errors' do
  				expect(classroom.errors.count).to be_zero
  			end

  			it 'can be saved' do
  				expect(classroom.save).to be_truthy
  			end
		end

		context 'when :student is duplicated in :course' do
			course = Course.find(1)			
			student = Student.find(1)
			classroom = Classroom.new(course: course, student: student)

			it 'is not valid' do
				expect(classroom.valid?).to be_falsey
			end

			it 'has :student error' do
				expect(classroom.errors).to have_key(:student_id)
			end

			it 'cannot be saved' do
				expect(classroom.save).to be_falsey
			end
		end
	end
end
