class AddStatusToArchivedTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :archived_tasks, :status, :integer, default: 0
  end
end
