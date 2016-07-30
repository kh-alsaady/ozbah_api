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

  # Add archived tasks to database according to speceified parameter
  def self.archive_tasks tasks, count
    tasks.each do |task|

      new_archived_user = self.next_user task.id
      next_user = nil

      # Archive task (tasks_count) times
      count.times do |i|
    
        new_archived_user = next_user unless  next_user.nil?
        # set created_at date
        creation_date = ( i == 0) ? DateTime.now : DateTime.now + i.day

        order_new_archived_user = UserTaskOrder.user_order(new_archived_user.id, task.id)
        # Get Next user
        next_user = UserTaskOrder.next_user(task.id, order_new_archived_user)

        ArchivedTask.create user: new_archived_user, task: task, status: 0, created_at: creation_date
      end
    end
  end

  # Delete archives old than 1 month
  def self.delete_old_daily_archives
    last_archive = self.daily_tasks.where(status: 1).last
    date = last_archived_task.created_at - 1.month
    self.daily_tasks.where("created_at < ?", date).destroy_all
  end

  # Delete archives old than 3 month
  def self.delete_old_weekly_archives
    last_archive = self.weekly_tasks.where(status: 1).last
    date = last_archived_task.created_at - 3.month
    self.where("created_at < ?", date).destroy_all
  end

  def self.next_user task_id
    current_archived_user = self.current_archived_user_in_task task_id

    order_current_user = UserTaskOrder.user_order(current_archived_user.id, task_id) if current_archived_user
    # return next user
    current_archived_user.present?  ? UserTaskOrder.next_user(task_id, order_current_user) : UserTaskOrder.first_user_in_task(task_id)
  end


  # Get last user did this task if not exist git first user for this task
  def self.current_archived_user_in_task task_id
    current_archived_task = self.find_by(task_id: task_id, status: 1)
    current_archived_task.user if current_archived_task.present?
  end

  def self.last_archived_task_for task_type
    last_archive_task = self.includes(:task => :task_type)
      .where('task_types.name = ?', task_type)
      .references(:task => :task_type).last
    # last_archive_task.user if last_archive_task
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

  def comming_task

  end

  def next_tasks
  end

end
