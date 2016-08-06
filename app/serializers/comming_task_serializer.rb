class CommingTaskSerializer < ActiveModel::Serializer
  attribute :task_name
  attribute :date, unless: -> {is_today_task?}

  def date
    object.created_at.strftime("%A %d-%m-%Y")
  end

  def task_name
    object.task.name
  end

end
