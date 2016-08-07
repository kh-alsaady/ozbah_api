class DeleteOldDailyArchivesWorker
  @queue = :archived_tasks

  def self.perform
    # Delete archives older than 1 month
    ArchivedTask.delete_old_daily_archives 1.month
    puts 'DeleteOldDailyArchivesWorker Executed'
  end

end
