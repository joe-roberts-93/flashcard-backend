require 'jwt'

class ApplicationController < ActionController::API
  include JwtHelper

  # before_action :authenticate_request, except: [:login, :signup]
  # CURRENTLY SETTING USER TO FIRST USER IN DATABASE
  before_action :set_user_as_first_user

  private

  def set_user
    @user = User.find(@current_user_id)
  end

  def set_user_as_first_user
    @user = User.first
  end

  def authenticate_request
    token = request.headers['Authorization']&.split(' ')&.last

    begin
      decoded_token = decode_token(token)
      @current_user_id = decoded_token.first['user_id']
      set_user
    rescue JWT::DecodeError
      render json: { error: 'Invalid token' }, status: :unauthorized
    end
  end
end
