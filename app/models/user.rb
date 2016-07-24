class User < ApplicationRecord
  include Authentication
  
  has_many :archived_tasks
  has_many :user_task_orders
  has_many :api_tokens

  validates :email, presence: true, uniqueness: true, allow_nil: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: I18n.t('invalid_email_format')

end
