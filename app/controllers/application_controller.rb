require "application_responder"

class ApplicationController < ActionController::Base
  include ApplicationHelper
  add_flash_types :errors
  self.responder = ApplicationResponder
  respond_to :html

  include Pundit

  NotAuthorized = Class.new(StandardError)

  def authenticate!
    raise ApplicationController::NotAuthorized if current_user.nil?
  end

  def format_errors(errors)
    if errors.methods.include?(:full_messages)
      errors = errors.full_messages
    end
    { errors: errors.map { |m| {message: m} } }
  end

  rescue_from ApplicationController::NotAuthorized do |exception|
    respond_to do |format|
      format.json { render json: { "error": "Unauthenticated" }, status: 401 }
      format.html { redirect_to root_path, alert: "Unauthorized" }
    end
  end

  if Rails.env.production?
    rescue_from ActiveRecord::RecordNotFound do
      respond_to do |format|
        format.json { render json: { error: "Not found" }, status: 404 }
        format.html { redirect_to root_path, alert: "Not found" }
      end
    end
  end

  rescue_from Pundit::NotAuthorizedError do
    respond_to do |format|
      format.json { render json: { "error": "Unauthenticated" }, status: 401 }
      format.html do
        redirect_to request.referrer || root_path, alert: "You are not authorized to perform this action."
      end
    end
  end

  def current_user
    return @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def user_signed_in?
    current_user.present?
  end
  helper_method :user_signed_in?
end
