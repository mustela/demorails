class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def response_api(status,message,data,errors)
  	resp_obj = {
  		status: status,
  		message: message,
  		data: data,
  		errors: errors
  	}

  	render :json => resp_obj.to_json
  end

  def response_api_include(relation,status,message,data,errors)
  	resp_obj = {
  		status: status,
  		message: message,
  		data: data,
  		errors: errors
  	}

  	render :json => resp_obj.to_json(:include => relation)
  end	

end
