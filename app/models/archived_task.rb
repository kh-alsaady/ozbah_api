class ArchivedTask < ApplicationRecord
  belongs_to :User
  belongs_to :task
end
