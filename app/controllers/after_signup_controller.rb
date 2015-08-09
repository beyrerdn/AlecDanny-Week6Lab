class AfterSignupController < ApplicationController
  include Wicked::Wizard

  steps :name, :username, :bio, :image

    def show
      binding.pry
      @user = current_user
      render_wizard
    end

    def update
      @user = current_user
      @user.update(user_params)
      render_wizard(@user)
    end

    private

    def user_params
      params.require(:user).permit(:username, :first_name, :last_name, :bio, :image)
    end
end
