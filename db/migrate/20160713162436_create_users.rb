class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string  :full_name, default: ''
      t.string  :email,     default: ''
      t.integer :weekly_order
      t.integer :daily_order

      t.timestamps
    end
  end
end
