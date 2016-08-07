class ArchiveWeeklyTasksWorker
  @queue = :archived_tasks

  def self.perform
    # Archive tasks for the next 4 weeks
    ArchivedTask.archive_weekly_tasks 16
    puts 'ArchiveWeeklyTasksWorker Executed'
  end

end
