class DeleteOldWeeklyArchivesWorker
  @queue = :archived_tasks

  def self.perform
    # Delete archives older than 3 month
    ArchivedTask.delete_old_weekly_archives 3.month
    puts 'DeleteOldWeeklyArchivesWorker Executed'
  end

end
