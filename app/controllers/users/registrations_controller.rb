class Users::RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    binding.pry
    super
  end

  protected

  def after_sign_up_path_for(resource)
    after_signup_path
  end
end
