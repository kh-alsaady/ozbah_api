class Api::V1::UsersController < Api::V1::BaseController
  def index
    render_response true, 'success', {}, 200
  end
end
