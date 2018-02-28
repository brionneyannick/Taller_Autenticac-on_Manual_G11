class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def authenticate_user!
    redirect_to new_session_path unless helpers.logged?
  end
end
