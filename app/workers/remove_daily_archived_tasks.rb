class RemoveDailyArchivedTasks
  @queue = :archived_tasks

  def self.perform
    ArchivedTask.delete_daily_archived_tasks    
  end

end
