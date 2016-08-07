class ArchiveDailyTasksWorker
  @queue = :archived_tasks

  def self.perform
    # Archive tasks for the next month
    ArchivedTask.archive_daily_tasks 30
    puts 'ArchiveDailyTasksWorker Executed'
  end

end
