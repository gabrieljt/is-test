class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.belongs_to :course
      t.belongs_to :student
      t.datetime :entry_at
      t.timestamps
    end
  end
end
