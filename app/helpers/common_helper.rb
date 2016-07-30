module CommonHelper

  def self.notify_users_for_tasks tasks
    tasks.each do |task|
      # Get User to Notify for this task
      current_archived_user = ArchivedTask.current_archived_user_in_task task.id

      order_current_archived_user = UserTaskOrder.user_order(current_archived_user.id, task.id) if current_archived_user

      next_user = current_archived_user.present?  ? UserTaskOrder.next_user(task.id, order_current_archived_user)
                                                  : UserTaskOrder.first_user_in_task(task.id)

      # Send Email to Next User
      task_type = task.task_type.name.downcase
       NotifierMailer.notify_user_for_task(task, next_user).deliver_now

      print(task.task_type.name, ': ', task.name,'===========>', next_user.full_name )
      puts

      # Update Current Archived User
      ArchivedTask.create user: next_user, task: task, status: 1
    end
  end
end
