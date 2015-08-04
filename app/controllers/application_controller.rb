class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :find_subjects
  private
  def find_subjects
    @subjects = Subject.visible.sorted
  end
def confirm_logged_in
    unless session[:user_id]
      flash[:danger] = "Please log in."
      redirect_to(:controller => 'users', :action => 'login')
      return false
    else
      return true
    end
end
end