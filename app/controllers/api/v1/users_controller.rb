class Api::V1::UsersController < Api::V1::BaseController

  def comming_tasks
    tasks = @current_user.comming_tasks.first(4)
    return render_response true, I18n.t('data_not_found'), [], 200 if tasks.empty?

    today_tasks = Task.today_tasks(tasks)

    if today_tasks.any?
      today_tasks = today_tasks.map{|arch_task| arch_task.task.name}.join(', ')
    else
      today_tasks =  I18n.t('no_task_today')
    end

    # Serialize Date
    tasks = serialize Task.next_tasks(tasks), CommingTaskSerializer

    render_response true, I18n.t('data_found'), { today_tasks: today_tasks, next_tasks: tasks }, 200
  end

end
