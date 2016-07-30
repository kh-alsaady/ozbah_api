class ApplicationController < ActionController::API

  # Action to follow routes with HTTP verb 'OPTIONS'
  def cors
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token, Content-Type'
    headers['Access-Control-Max-Age'] = '1728000'

    render text: '', content_type: 'text/plain'
  end
end
