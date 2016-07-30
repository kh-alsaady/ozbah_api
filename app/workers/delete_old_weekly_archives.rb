class DeleteOldWeeklyArchivesWorker
  @queue = :archived_tasks

  def self.perform
    ArchivedTask.delete_old_weekly_archives
  end

end
