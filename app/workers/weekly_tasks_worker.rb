class WeeklyTasksWorker
  include CommonHelper

  @queue = :weekly_tasks

  def self.perform
    weekly_tasks = Task.weekly_tasks
    CommonHelper.notify_users_for_tasks weekly_tasks
    puts 'WeeklyTasksWorker Executed'
  end

end
