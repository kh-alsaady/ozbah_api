class DailyTasksWorker
  include CommonHelper

  @queue = :daily_tasks

  def self.perform
    # Get all dially tasks
    daily_tasks = Task.daily_tasks
    CommonHelper.notify_users_for_tasks daily_tasks
    # daily_tasks.each do |task|
    #   # Get User to Notify for this task
    #   current_archived_user = ArchivedTask.current_archived_user_in_task task.id
    #
    #   order_current_archived_user = UserTaskOrder.user_order(current_archived_user.id, task.id) if current_archived_user
    #
    #   next_user = current_archived_user.present?  ? UserTaskOrder.next_user(task.id, order_current_archived_user)
    #                                               : UserTaskOrder.first_user_in_task(task.id)
    #
    #   # Send Email to Next User
    #   NotifierMailer.daily_task(task, next_user).deliver_now
    #   sleep 5
    #   # Update Current Archived User
    #   ArchivedTask.create user: next_user, task: task
    # end
  end

end
