class DeleteOldDailyArchivesWorker
  @queue = :archived_tasks

  def self.perform
    ArchivedTask.delete_old_daily_archives
    puts 'DeleteOldDailyArchivesWorker'
  end

end
