class DailyTasksWorker
  include CommonHelper

  @queue = :daily_tasks

  def self.perform
    daily_tasks = Task.daily_tasks
    CommonHelper.notify_users_for_tasks daily_tasks
    puts 'DailyTasksWorker Executed'
  end

end
