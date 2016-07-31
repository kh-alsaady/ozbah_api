class ChangeCreatedAtColumnToDateInArchivedTasks < ActiveRecord::Migration[5.0]
  def change
    change_column :archived_tasks, :created_at, :date, default: Date.today
  end
end
