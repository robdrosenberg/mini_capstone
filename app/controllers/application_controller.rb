class ApplicationController < ActionController::API
  include Knock::Authenticable

  def authenticate_admin
    unless current_user.admin
      render json: {message: "You need more POWA!"}, status: :unauthorized
    end  
  end

  # def authenticate_user
  #   unless current_user
  #     render json: {message: "You aren't a user!"}, status: :unauthorized
  #   end
  # end

end
