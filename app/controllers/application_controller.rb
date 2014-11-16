class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :authenticate_user!, :check_first
  
  
  protect_from_forgery with: :exception
  def check_first
    if user_signed_in?
      c = User.all.count
      if c == 1
        u = User.find(current_user.id);
        u.update(is_admin: true)
      end
    end

  end
  
  def check_adminity
    if user_signed_in?
      if current_user.is_admin
      else
        redirect_to root_path
      end
    end
  end

end
