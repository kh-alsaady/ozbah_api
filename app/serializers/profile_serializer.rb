class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :email, :profile_image
end
