class ArchiveWeeklyTasksWorker
  @queue = :archived_tasks

  def self.perform
    weekly_tasks = Task.weekly_tasks
    # Archive tasks for the next 4 weeks
    ArchivedTask.archive_tasks weekly_tasks, 16
    puts 'ArchiveWeeklyTasksWorker Executed'
  end

end
