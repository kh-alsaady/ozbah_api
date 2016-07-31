class Api::V1::ProfilesController < Api::V1::BaseController

  def show
    user = @current_user
    # Serialize data
    user = ProfileSerializer.new user

    render_response true, I18n.t('data_found'), user, 200
  end
end
