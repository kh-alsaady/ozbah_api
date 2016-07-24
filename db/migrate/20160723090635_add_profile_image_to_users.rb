class AddProfileImageToUsers < ActiveRecord::Migration[5.0]
  def self.up
    change_table :users do |t|
      t.remove :daily_order
      t.remove :weekly_order
      t.string :profile_image, default: ''
      t.string :username, unique: true, null: false
    end
  end

  def self.down
    change_table :users do |t|
      t.integer :daily_order
      t.integer :weekly_order
      t.remove :profile_image
      t.remove :username
    end
  end
end
