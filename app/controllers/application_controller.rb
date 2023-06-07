class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def configure_permitted_parameters
  # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username first_name last_name city age_range profile_description profile_picture])

  # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username first_name last_name city age_range profile_description profile_picture])
  end
end
