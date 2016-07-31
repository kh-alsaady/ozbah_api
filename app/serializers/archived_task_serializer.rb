class ArchivedTaskSerializer < ActiveModel::Serializer
  attributes :date, :user, :task

  def date
    object.created_at.strftime("%A %d-%m-%Y")
  end

  def user
    object.user.full_name if object.user
  end

  def task
    object.task.name if object.task
  end
end
