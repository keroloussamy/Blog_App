module Api
  class AuthenticationController < ApplicationController
    rescue_from ActionController::ParameterMissing, with: :parameter_missing

    def login
      params.require(:password).inspect
      user = User.find_by(email: params.require(:email))
      token = AuthenticationTokenService.call(user.id)

      render json: { token: }, status: :created
    end

    def sign_up
      build_resource(sign_up_params)
      resource.save
      sign_up(resource_name, resource) if resource.persisted?

      render_jsonapi_response(resource)
    end

    private

    def parameter_missing()
      render json: { error: e.message }, status: :unproccessable_entity
    end
  end
end
