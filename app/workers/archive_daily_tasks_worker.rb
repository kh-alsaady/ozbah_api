class ArchiveDailyTasksWorker
  @queue = :archived_tasks

  def self.perform
    # Get all Daily tasks
    daily_tasks = Task.daily_tasks
    # Archive tasks for the next 1 month
    ArchivedTask.archive_tasks daily_tasks, 30
    puts 'ArchiveDailyTasksWorker'
  end

end
