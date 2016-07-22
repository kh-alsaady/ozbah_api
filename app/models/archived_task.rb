class ArchivedTask < ApplicationRecord
  belongs_to :user
  belongs_to :task

  scope :daily_tasks, -> {
    includes(:task => :task_type)
    .where('task_types.name = ?', 'Daily Task')
    .references(:task => :task_type)
  }

  scope :weekly_tasks, -> {
    includes(:task => :task_type)
    .where('task_types.name = ?', 'Weekly Task')
    .references(:task => :task_type)
  }

  def self.last_archived_task_for task_type
    last_archive_task = self.includes(:task => :task_type)
      .where('task_types.name = ?', task_type)
      .references(:task => :task_type).last
    # last_archive_task.user if last_archive_task
  end

  # Get last user did this task if not exist git first user for this task
  def self.current_archived_user_in_task task_id
    current_archived_task = self.where(task_id: task_id).last
    current_archived_task.user if current_archived_task.present?
  end

  # Remove daily archived tasks old than 1 month
  def self.delete_daily_archived_tasks
    date = self.daily_tasks.last.created_at - 1.month
    self.daily_tasks.where("archived_tasks.created_at < ?", date).destroy_all
  end

  # Remove weekly archived tasks old than 3 month
  def self.delete_weekly_archived_tasks
    date = self.weekly_tasks.last.created_at - 3.month
    self.weekly_tasks.where("archived_tasks.created_at < ?", date).destroy_all
  end
end
