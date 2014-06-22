class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  
  def paypal
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_paypal_oauth(request.env["omniauth.auth"])
    
    Rails.logger.info request.env["omniauth.auth"].to_yaml
    
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Paypal") if is_navigational_format?
    else
      session["devise.paypal_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
  
  
end