class DailyTasksWorker
  include CommonHelper

  @queue = :daily_tasks

  def self.perform
    # Get all daily tasks
    daily_tasks = Task.daily_tasks
    CommonHelper.notify_users_for_tasks daily_tasks
    puts 'DailyTasksWorker'
  end

end
