# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

students = Student.create([{ name: 'John Doe' }, 
						   { name: 'Alice Cooper' }, 
						   { name: 'Bob Earl' }, 
						   { name: 'Cassandra Miggs'}])

courses = Course.create([{ name: 'ORM', description: 'Learn how to associate models like a boss.', status: 0 },
						 { name: 'Validation', description: 'Do not let bad data into your base!', status: 2 },
						 { name: 'Enums', description: 'Make extensible models with the power of Enums.', status: 1},
						 { name: 'Routing', description: 'Your users will never get lost again when your learn how to route properly!', status: 0}])

classrooms = Classroom.create([{ course_id: 1, student_id: 1 },
							   { course_id: 1, student_id: 2 },
							   { course_id: 2, student_id: 1 },
							   { course_id: 2, student_id: 2 },
							   { course_id: 2, student_id: 4 },
							   { course_id: 3, student_id: 2 },
							   { course_id: 3, student_id: 3 },
							   { course_id: 4, student_id: 1 },
							   { course_id: 4, student_id: 2 },
							   { course_id: 4, student_id: 3 }])