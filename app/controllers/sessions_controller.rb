class SessionsController < Devise::SessionsController
  def new
    @background_image = "register-background"
    super
  end
end