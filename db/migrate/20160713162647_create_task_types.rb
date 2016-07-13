class CreateTaskTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :task_types do |t|
      t.string :name, default: true
      t.timestamps
    end
  end
end
