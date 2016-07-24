class ApiToken < ApplicationRecord
  belongs_to :user

  before_create :generate_unique_token

  def generate_unique_token
    token = ''
    loop do
      token = SecureRandom.base64(32)
      break unless ApiToken.exists?(access_token: token)
    end
    self.access_token = token
  end
end
