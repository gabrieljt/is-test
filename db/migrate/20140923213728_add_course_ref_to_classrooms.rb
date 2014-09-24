class AddCourseRefToClassrooms < ActiveRecord::Migration
  def change
    add_reference :classrooms, :course, index: true
  end
end
