class User < ApplicationRecord
  include Authentication

  has_many :archived_tasks
  has_many :user_task_orders
  has_many :api_tokens

  validates :email, presence: true, uniqueness: true, allow_nil: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: I18n.t('invalid_email_format')

  # Get user's comming tasks
  def comming_tasks
    archived_tasks.eager_load(:task).where("archived_tasks.status = 0 ").order("archived_tasks.created_at")
  end


end
