module Authentication

  extend ActiveSupport::Concern

  included do
    # to use helpers/redis_helper methods
    extend RedisHelper

    has_secure_password validations: false

    # Signup or login user using social networks
    # def self.social_signup social_type, social_id, user_params
    #   profile_image     = user_params[:profile_image]
    #   background_image  = user_params[:background_image]
    #   @user_params      = user_params
    #
    #   user = User.find_by("#{social_type}_id": social_id )
    #
    #   # Register new user using specified social type
    #   unless user.present?
    #     # Uplaod profile_image and background_image to cloudinary if exist
    #     upload_images profile_image, background_image
    #
    #     user = User.new @user_params
    #     user.save!(:validate => false)
    #   end
    #
    #   # Create new unique access token for the user in the db
    #   access_token = user.refresh_token
    #
    #   # Store Authenication token in redis
    #   $redis.set("token_#{access_token}", access_token)
    #
    #   user
    #
    # end

  end

  module ClassMethods
    # Login user using username/email and password
    def login login, password
      user = User.find_by("username = :login OR email = :login", {login: login} )

      if user && user.authenticate(password)
        # Generate unique access token in database
        access_token = user.refresh_token
        # Store user info in Redis
        user_info = {id: user.id, "token_#{access_token}".to_sym => access_token }
        #helpers/redis_helper

        set_to_redis(user_info, "users:user#{user.id}:")
        # $redis.set("users:user#{user.id}:access_token", access_token)
        user
      else
         false
      end
    end

    def destroy_session access_token
      api_token = ApiToken.eager_load(:user).where("api_tokens.access_token = ?", access_token).first
      # Delete user's access token from the database
      if api_token
        # Delete user's access token from Redis
        # helpers/redis_helper
        delete_from_redis(["token_#{api_token.access_token}".to_sym], "users:user#{api_token.user.id}:")
        api_token.try :destroy
      else
        false
      end
    end

  end

  # Instanse methods
  def refresh_token
    api_token = api_tokens.create
    api_token.access_token
  end

end
