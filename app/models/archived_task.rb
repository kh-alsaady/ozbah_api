class ArchivedTask < ApplicationRecord
  belongs_to :user
  belongs_to :task

  # Get last archived user according to task type as string
  # def self.last_user_for task_type
  #   last_archive_task = self.includes(:task => :task_type, :user => :user_task_orders).where('task_types.name = ?', task_type).references(:task => :task_type, :user => :user_task_orders).last
  #
  #   last_archive_task.user if last_archive_task
  # end

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

  # def self.last_archived_task_for task_type
  #   last_archive_task = self.includes(:task => :task_type)
  #     .where('task_types.name = ?', task_type)
  #     .references(:task => :task_type).last
  #
  #   # last_archive_task.user if last_archive_task
  # end
end
