class Api::V1::UsersController < Api::V1::BaseController

  def comming_tasks
    tasks = @current_user.comming_tasks.first(4)
    return render_response true, I18n.t('data_not_found'), nil, 200 if tasks.empty?

    # tasks = ActiveModel::Serializer::ArraySerializer.new(tasks, each_serializer: CommingTaskSerializer)
    today_task =  I18n.t('no_task_today')

    if tasks[0].created_at == Date.today
      today_task = CommingTaskSerializer.new tasks[0], scope: is_today_task?(true), scope_name: :is_today_task?
      tasks.delete_at(0)
    end

    # Serialize Date
    tasks = serialize tasks, CommingTaskSerializer

    render_response true, I18n.t('data_found'), { today_task: today_task, next_tasks: tasks }, 200
  end

  private

  def is_today_task? value
    value
  end

  def serialize data, serializer
    data.map do |d|
      serializer.new d, scope: is_today_task?(false), scope_name: :is_today_task?
    end
  end
end
