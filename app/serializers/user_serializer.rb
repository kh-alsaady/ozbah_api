class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :email, :access_token, :profile_image

  def access_token
    object.api_tokens.last.access_token
  end
end
