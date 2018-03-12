class ApplicationController < ActionController::API
  rescue_from ActionController::ParameterMissing, with: :render_parameter_missing
  rescue_from Selenium::WebDriver::Error::TimeOutError, with: :render_timeout_error 

  def render_parameter_missing(exception)
    render json: { error: exception.message }, status: :unauthorized
  end

  def render_timeout_error(exception)
    render json: { error: exception.message }, status: :not_found
  end
end
