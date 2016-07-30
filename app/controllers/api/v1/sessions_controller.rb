class Api::V1::SessionsController < Api::V1::BaseController
  skip_before_action :authenticate, only: [:create]

  def create
    missing_params = check_required_params params, [:login, :password]
    return  render_response false, I18n.t('missing_params') + missing_params.join(', '), {}, 400 unless missing_params.empty?

    user = User.login params[:login], params[:password]

    if user
      user = UserSerializer.new(user)
      return render_response true, I18n.t('login_success'), user, 200
    else
      return render_response false, I18n.t('login_faild'), {}, 400
    end
  end

  def destroy
    access_token = request.headers[:HTTP_ACCESS_TOKEN]
    if User.destroy_session access_token
      render_response true, I18n.t('logout_success'), {}, 200
    else
      render_response false, I18n.t('logout_faild'), {}, 400
    end
  end

end
