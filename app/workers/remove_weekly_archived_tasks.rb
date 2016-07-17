class RemoveWeeklyArchivedTasks
  @queue = :archived_tasks

  def self.perform
    ArchivedTask.delete_weekly_archived_tasks
  end

end
