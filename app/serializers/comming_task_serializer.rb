class CommingTaskSerializer < ActiveModel::Serializer
  attributes :date, :task_name

  def date
    object.created_at.strftime("%A %d-%m-%Y")
  end

  def task_name
    object.task.name
  end

end
