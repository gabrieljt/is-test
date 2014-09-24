class AddStudentRefToClassrooms < ActiveRecord::Migration
  def change
    add_reference :classrooms, :student, index: true
  end
end
