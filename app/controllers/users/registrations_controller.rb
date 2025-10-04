# app/controllers/users/registrations_controller.rb
class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(sign_up_params)

    if resource.save
      # Don’t sign in with session
      token = Warden::JWTAuth::UserEncoder.new.call(resource, :user, nil).first
      render json: { message: "Signed up successfully.", token: token, user: resource }, status: :created
    else
      render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
