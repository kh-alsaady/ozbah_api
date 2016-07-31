class WeeklyTasksWorker
  include CommonHelper

  @queue = :weekly_tasks

  def self.perform
    # Get all weekly tasks
    weekly_tasks = Task.weekly_tasks
    CommonHelper.notify_users_for_tasks weekly_tasks
    puts 'WeeklyTasksWorker'
  end

end
