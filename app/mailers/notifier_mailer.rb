class NotifierMailer < ApplicationMailer

  def notify_user_for_task(task, user)
    @task, @user = task, user
    @task_type = task.task_type.name

    mail to: @user.email, subject: "Ozbah #{@task_type}"
  end

end
