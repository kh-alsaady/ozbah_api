class ArchivedTask < ApplicationRecord
  belongs_to :user
  belongs_to :task

  scope :daily_tasks, -> {
    eager_load(:task => :task_type).where('task_types.name = ?', 'Daily Task')
  }

  scope :weekly_tasks, -> {
    eager_load(:task => :task_type).where('task_types.name = ?', 'Weekly Task')
  }

  scope :last_archive_for_task, -> (task_id) { where(task_id: task_id).last }

  # Add archived tasks to database n times according to speceified parameter
  def self.archive_daily_tasks count
    Task.daily_tasks.each do |task|
      last_archive     = self.last_archive_for_task(task.id)
      last_stored_user = last_archive.try(:user)
      next_user        = nil

      # Archive task (n) times
      count.times do |i|
        if last_stored_user.nil?
          next_user = UserTaskOrder.first_user_in_task(task.id)
        else
          order_last_stored_user = UserTaskOrder.user_order(last_stored_user.id, task.id)
          next_user = UserTaskOrder.next_user(task.id, order_last_stored_user)
        end

        creation_date = ( i == 0) ? Date.today : Date.today + i.day

        ArchivedTask.create user: next_user, task: task, status: 0, created_at: creation_date

        last_stored_user = next_user
      end
    end
  end

  def self.archive_weekly_tasks count
    Task.weekly_tasks.each do |task|
      last_archive     = self.last_archive_for_task(task.id)
      last_stored_user = last_archive.try(:user)
      next_user        = nil

      # Archive task (n) times
      count.times do |i|
        if last_stored_user.nil?
          next_user = UserTaskOrder.first_user_in_task(task.id)
        else
          order_last_stored_user = UserTaskOrder.user_order(last_stored_user.id, task.id)
          next_user = UserTaskOrder.next_user(task.id, order_last_stored_user)
        end

        creation_date = ( i == 0) ? Date.today : (Date.today + 7.days)

        ArchivedTask.create user: next_user, task: task, status: 0, created_at: creation_date

        last_stored_user = next_user
      end
    end
  end

  # Delete archives old than 1 month
  def self.delete_old_daily_archives date
    self.daily_tasks.where("archived_tasks.created_at < ?", Date.today - date).destroy_all
  end

  # Delete archives old than 3 month
  def self.delete_old_weekly_archives date
    self.weekly_tasks.where("archived_tasks.created_at < ?", Date.today - date).destroy_all
  end

  def self.next_user task_id
    current_archived_user = self.current_archived_user_in_task task_id

    order_current_user = UserTaskOrder.user_order(current_archived_user.id, task_id) if current_archived_user
    # return next user
    current_archived_user.present?  ? UserTaskOrder.next_user(task_id, order_current_user) : UserTaskOrder.first_user_in_task(task_id)
  end

  # Get last user did this task if not exist git first user for this task
  def self.current_archived_user_in_task task_id
    current_archived_task = self.where(task_id: task_id, status: 1).last
    current_archived_task.user if current_archived_task.present?
  end

  def self.search date
    date = Date.parse(date)
    eager_load(:user, :task).where("archived_tasks.created_at = ?", date)
  end

end
