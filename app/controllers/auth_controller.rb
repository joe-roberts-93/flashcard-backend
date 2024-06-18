class AuthController < ApplicationController
  include jwt_helper

  def login
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      token = encode_token({ user_id: user.id })
      render json: token
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end

  def signup
    user = User.create(user_params)

    if user.valid?
      token = encode_token({ user_id: user.id })
      render json: token, status: :created
    else
      render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
