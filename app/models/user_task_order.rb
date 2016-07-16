class UserTaskOrder < ApplicationRecord
  belongs_to :user
  belongs_to :task

  # Get First user in Task according to order
  def self.first_user_in_task task_id
    self.find_by(task_id: task_id, order: 1).user
  end

  # scope :first_user_in_task, lambda{ |task_id|
  #   includes(:user_task_orders)
  #   .where('user_task_orders.task_id = ? AND user_task_orders.order = 1', task_id)
  #   .references(:user_task_orders).first
  # }

  # Get user order in specified task
  def self.user_order user_id, task_id
    self.find_by(user_id: user_id, task_id: task_id).order
  end

  # Get next user
  def self.next_user task_id, current_user_order
    next_user_order = (current_user_order == User.count) ? 1 : (current_user_order + 1)
    self.includes(:user).find_by(task_id: task_id, order: next_user_order).user
  end
end
