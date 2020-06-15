class ApplicationController < ActionController::Base
  before_action :authenticate_request, except: [:user]
  rescue_from ActiveModel::UnknownAttributeError, with: :render_bad_request
  attr_reader :current_user

  protect_from_forgery
  skip_before_action :verify_authenticity_token, if: :json_request?

  protected

  def json_request?
    request.format.json?
  end

  def authenticate_request
    @current_user ||= Authorization.authorize(request.headers)
    render json: { error: "Missing token or Not Authorized" }, status: 401 unless @current_user
  end

  def render_bad_request(exception)
    render json: exception, status: :bad_request
  end
end
