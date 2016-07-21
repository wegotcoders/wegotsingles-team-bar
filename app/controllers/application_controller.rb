class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :current_customer
  
  Customer ||= Struct.new(:profile)
  
  def current_customer
    @current_customer ||= Customer.new(Profile.where(username: "Dafman").first)
  end
end
