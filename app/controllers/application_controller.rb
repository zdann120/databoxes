class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized
  include Pundit

  private

  def not_authorized
    render plain: 'Sorry, you cannot view this.'
  end
end
