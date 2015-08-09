class Users::RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
  end

  protected

  def after_sign_up_path_for(resource)
    '/after_signup'
  end
end
