class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :verifie_que_le_gars_est_connecte, except: [:login]

  helper_method 'connected?', 'this_user_is_me?', 'current_user'

  Data = Struct.new(:id, :nom)

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

  def broadcast(data, type, message, channel='notifications_channel')
    ActionCable.server.broadcast(
      channel,
      notification_render(data, type, message)
    )
  end

  def notification_render(data, type, message)
    ApplicationController.renderer.render(
      partial: 'accueil/notification',
      locals: { id: data.id, type: type, message: "#{data.nom}#{message}"}
    )
  end
end
