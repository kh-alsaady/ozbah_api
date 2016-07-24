module Responder

	def render_response success = false, message = '', data = nil, status_code = 400
		render json: { success: success, message: message, data: data }, status: status_code 
	end

end