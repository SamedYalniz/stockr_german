class RegistrationsController < Devise::RegistrationsController

  private
  
  def after_update_path_for(resource)
    user_path(resource)
  end

  def sign_up_params
    params.require(:user).permit( :email, :password, :password_confirmation, :description, :street, :city, :country, :contact_number, :company_name, :postcode)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :description, :street, :city, :country, :contact_number, :company_name, :postcode)
  end
end
