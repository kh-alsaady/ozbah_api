class User < ApplicationRecord
  has_many :archived_tasks
end
