class AfterSignupController < ApplicationController
  before_filter :authenticate_user!
  include Wicked::Wizard

  steps :name, :username, :bio, :image

    def show
      @user = current_user
      render_wizard
    end

    def update
      @user = current_user
      @user.update(user_params)
      render_wizard @user
    end

    private

    def user_params
      params.require(:user).permit(:username, :first_name, :last_name, :bio, :image)
    end

    def redirect_to_finish_wizard
      redirect_to post_path, notice: "Thank you for signing up."
    end
end
