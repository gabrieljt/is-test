class RemoveEntryAtFromClassroom < ActiveRecord::Migration
  def change
    remove_column :classrooms, :entry_at, :datetime
  end
end
