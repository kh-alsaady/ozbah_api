class Api::V1::UsersController < Api::V1::BaseController

  def comming_tasks
    tasks = @current_user.comming_tasks.first(4)
    return render_response true, I18n.t('no_daily_task'), nil, 200 if tasks.empty?
    # Serialize Date
    tasks = serialize tasks, CommingTaskSerializer
    # tasks = ActiveModel::Serializer::ArraySerializer.new(tasks, each_serializer: CommingTaskSerializer)
    first_task = tasks[0]
    tasks.delete_at(0)

    render_response true, I18n.t('data_found'), { first_task: first_task, next_tasks: tasks }, 200
  end
end
