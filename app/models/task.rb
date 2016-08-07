class Task < ApplicationRecord
  belongs_to :task_type
  has_many :archived_tasks
  has_many :user_orders, class_name: 'UserTaskOrder'

  scope :daily_tasks, -> {
    includes(:task_type)
    .where('task_types.name = ?', 'Daily Task')
    .references(:task_type)
  }

  scope :weekly_tasks, -> {
    includes(:task_type)
    .where('task_types.name = ?', 'Weekly Task')
    .references(:task_type)
  }

  def self.today_tasks tasks
    tasks.select{ |t| t.created_at == Date.today }
  end

  def self.next_tasks tasks
    tasks.select{ |t| t.created_at != Date.today }
  end

end
