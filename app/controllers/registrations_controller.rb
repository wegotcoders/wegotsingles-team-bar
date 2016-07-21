class RegistrationsController < Devise::RegistrationsController 
  
  def create
    Customer.new sign_up_params
    super
  end

  private

  def sign_up_params
    params.require(:customer).permit(:username, :email, :password, :password_confirmation)
  end

end
