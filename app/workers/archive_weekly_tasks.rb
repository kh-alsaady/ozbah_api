class ArchiveWeeklyTasksWorker
  @queue = :weekly_tasks

  def self.perform
    # Get all Weekly tasks
    weekly_tasks = Task.weekly_tasks
    # Archive tasks for the next 4 weeks
    ArchivedTask.archive_tasks weekly_tasks, 16
  end

end
