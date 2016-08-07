class ArchiveDailyTasksWorker
  @queue = :archived_tasks

  def self.perform
    daily_tasks = Task.daily_tasks
    # Archive tasks for the next month
    ArchivedTask.archive_tasks daily_tasks, 30
    puts 'ArchiveDailyTasksWorker Executed'
  end

end
