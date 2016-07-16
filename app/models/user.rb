class User < ApplicationRecord
  has_many :archived_tasks
  has_many :user_task_orders

  

  # def self.order_current_archived_user_in_task task_id
  #   current_archived_task = ArchivedTask.where(task_id: task_id).last
  #   current_archived_task.user if current_archived_task
  # end
end
