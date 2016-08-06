class ApplicationController < ActionController::API

  before_action :cors_set_access_control_headers
  # Action to follow routes with HTTP verb 'OPTIONS'
  def cors
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token, Content-Type, access_token'
    headers['Access-Control-Max-Age'] = '1728000'

    render text: '', content_type: 'text/plain'
  end


  # This method will set the access control header accordingly after each action performed.
	def cors_set_access_control_headers
  	headers['Access-Control-Allow-Origin'] = '*'
  	headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
  	headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
  	headers['Access-Control-Max-Age'] = "1728000"
  end

# def cors_set_access_control_headers
#     headers['Access-Control-Allow-Origin'] = '*'
#     headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
#     headers['Access-Control-Allow-Headers'] = 'X-Requested-With, Authorization, X-Prototype-Version, Token, Content-Type'
#     headers['Access-Control-Max-Age'] = "1728000"
# end

end
