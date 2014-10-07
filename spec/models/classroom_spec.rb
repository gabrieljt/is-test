require 'rails_helper'

RSpec.describe Classroom, :type => :model do
	course_name = 'Foo'
	student_name = 'John Doe'
	Course.create(name: course_name, description: 'Bar', status: 0)
	Student.create(name: student_name)
	Classroom.create(course_id: 1, student_id: 1)

	describe '#new' do
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
