class DailyTasksWorker
  @queue = :daily_tasks

  def self.perform
    puts 'daily tasks executed'
  end
end
