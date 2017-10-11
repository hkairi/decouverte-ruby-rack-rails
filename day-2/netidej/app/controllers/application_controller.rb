class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :verifie_que_le_gars_est_connecte, except: [:login]

  helper_method 'connected?', 'this_user_is_me?', 'current_user'

  def connected?
    !session[:user].nil?
  end

  def current_user
    session[:user]
  end

  def this_user_is_me?(user_id)
    session[:user]['id'] == user_id
  end

  def verifie_que_le_gars_est_connecte
    redirect_to login_path unless connected?
  end
end