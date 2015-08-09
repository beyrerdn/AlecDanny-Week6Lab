class AfterSignupController < ApplicationController
  include Wicked::Wizard

  steps :name, :username, :bio, :image

    def show
      binding.pry
      @profile = current_user.profile
      render_wizard(@profile)
    end

    def update
      @profile = current_user.profile
      @profile.update(profile_params)
      render_wizard(@profile)
    end

    private

    def profile_params
      params.require(:profile).permit(:username, :first_name, :last_name, :bio, :image, :user_id)
    end
end
