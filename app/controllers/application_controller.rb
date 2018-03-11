class ApplicationController < ActionController::API
  rescue_from RailsParam::Param::InvalidParameterError, with: :render_wrong_params_response
  rescue_from Selenium::WebDriver::Error::TimeOutError, with: :render_timeout_while_finding_element 

  def render_wrong_params_response(exception)
    render json: { error: exception.message }, status: :unauthorized
  end

  def render_timeout_while_finding_element(exception)
    render json: { error: exception.message }, status: :not_found
  end
end
