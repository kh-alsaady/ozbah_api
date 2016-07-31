class Api::V1::BaseController < ApplicationController
  include RedisHelper
  include Responder

  before_action :set_locale, :authenticate

  # Handling RecordNotFound Exception
  rescue_from ActiveRecord::RecordNotFound do |e|
    render_response false, e.message, {}, 404
  end

  # Handling RecordNotFound Exception
  rescue_from Exception do |e|
    render_response false, e.message, {}, 400
  end

  # Handling InvalidLocale Exception
  rescue_from I18n::InvalidLocale do |e|
    render_response false, e.message, {}, 400
  end

  protected

    # set current_user user
    def current_user
      access_token =  request.headers[:HTTP_ACCESS_TOKEN]
      @api_token ||= ApiToken.eager_load(:user).where("access_token = ?", access_token).first
      @current_user = @api_token.user if @api_token
    end

    # Check if user is authenticated
    def authenticate
      access_token =  request.headers[:HTTP_ACCESS_TOKEN]
      return render_response(false, I18n.t('login_required'), {}, 401) unless access_token &&
        current_user && get_from_redis(["token_#{access_token}"], "users:user#{@current_user.try(:id)}:")

    end

    def set_locale
      I18n.locale = params[:lang_code] || I18n.default_locale
    end

    def check_required_params params, required_params
      missing_params = []

      required_params.each do |p|
        missing_params << p if params[p].blank?
      end
      missing_params
    end

end
