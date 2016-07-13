class WeeklyTasksWorker
  @queue = :weekly_tasks

  def self.perform
    puts 'weekly_tasks executed'
  end
end
