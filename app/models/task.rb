class Task < ApplicationRecord
  belongs_to :task_type
  has_many :archived_tasks
end
