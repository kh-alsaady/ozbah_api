class User < ApplicationRecord
  has_many :archived_tasks
  has_many :user_task_orders

end
