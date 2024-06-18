require 'jwt'

class ApplicationController < ActionController::Base
  include JwtHelper

  # before_action :authenticate_request, except: [:login, :signup]

  private

  def authenticate_request
    token = request.headers['Authorization']&.split(' ')&.last

    begin
      decoded_token = decode_token(token)
      @current_user_id = decoded_token.first['user_id']
      @user = User.find(@current_user_id)
    rescue JWT::DecodeError
      render json: { error: 'Invalid token' }, status: :unauthorized
    end
  end
end
