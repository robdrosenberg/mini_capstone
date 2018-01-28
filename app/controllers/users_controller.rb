class UsersController < ApplicationController
  user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirm: params[:password_confirm]
    )
  if user.save
    render json: {message: "User created succesfully!"}, status: :created
  else
    render json: {errors: user.errors.full_messages}, status: :bad_request
  end
end
