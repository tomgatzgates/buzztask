class Api::UsersController < ApplicationController
  def create
    permitted_params = params.permit(:email, :password)
    user = User.create!(permitted_params)

    render status: :created, body: UserSerializer.new(user).serialized_json
  end
end
