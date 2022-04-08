module Api
  class AuthenticationController < ApplicationController
    rescue_from ActionController::ParameterMissing, with: :parameter_missing

    def login
      params.require(:password).inspect
      user = User.find_by(email: params.require(:email))
      token = AuthenticationTokenService.call(user.id)

      render json: { token: token }, status: :created
    end


    private
    def parameter_missing()
      render json: { error: e.message }, status: :unproccessable_entity
    end
  end
end