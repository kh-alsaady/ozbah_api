class CreateUserTaskOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :user_task_orders do |t|
      t.references :user, index: true, foreign_key: true
      t.references :task, index: true, foreign_key: true
      t.integer :order
      t.timestamps
    end
    add_index :user_task_orders, [:user_id, :task_id, :order], unique: true
  end
end
