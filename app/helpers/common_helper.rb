module CommonHelper

  def self.notify_users_for_tasks tasks
    tasks.each do |task|

      next_user = ArchivedTask.next_user task.id

      task_type = task.task_type.name.downcase
       NotifierMailer.notify_user_for_task(task, next_user).deliver_now

      # print(task.task_type.name, ': ', task.name,'===========>', next_user.full_name )
      # puts

      current_archive = ArchivedTask.find_by(user_id: next_user.id, task_id: task.id, status: 0)
      ArchivedTask.create(user_id: next_user.id, task_id: task.id, status: 1) unless current_archive
      # Update Current Archived User status
      current_archive.update(status: 1) if current_archive
    end
  end
end
