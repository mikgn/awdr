class ApplicationController < ActionController::Base
  before_action :authorize

  private

  def authorize
    redirect_to login_url unless User.find_by(id: session[:user_id])
  end
end
