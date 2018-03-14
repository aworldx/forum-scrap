class ApplicationController < ActionController::API
  rescue_from ActionController::ParameterMissing, with: :render_parameter_missing
  rescue_from Selenium::WebDriver::Error::TimeOutError, with: :render_timeout_error 

  def render_parameter_missing(exception)
    render json: { error: exception.message }, status: :bad_request
  end

  def render_timeout_error(exception)
    render json: { error: exception.message }, status: :gateway_timeout
  end
end
