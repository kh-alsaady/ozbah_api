class ApplicationController < ActionController::API

  before_action :cors_set_access_control_headers
  # Action to follow routes with HTTP verb 'OPTIONS'
  def cors
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Authorization, Token, Content-Type'
    headers['Access-Control-Max-Age'] = '1728000'

    render text: '', content_type: 'text/plain'
  end

  # This method will set the access control header accordingly after each action performed.
	# def cors_set_access_control_headers
  # 	headers['Access-Control-Allow-Origin'] = '*'
  # 	headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
  # 	headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
  #   headers['Access-Control-Allow-Headers'] = '*'
  # 	headers['Access-Control-Max-Age'] = "1728000"
  # end

def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'X-Requested-With, Authorization, X-Prototype-Version, Token, Content-Type'
    headers['Access-Control-Max-Age'] = "1728000"
end

# Fetch API cannot load http://52.32.142.241/api/v1/profile/. No 'Access-Control-Allow-Origin' header is present on the requested resource. Origin 'http://localhost:8080' is therefore not allowed access. If an opaque response serves your needs, set the request's mode to 'no-cors' to fetch the resource with CORS disabled


end
