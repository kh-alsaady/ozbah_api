class CreateArchivedTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :archived_tasks do |t|
      t.references :user, index: true, foreign_key: true
      t.references :task, index: true, foreign_key: true
      t.timestamps
    end
  end
end
