class SignUpsController < ApplicationController
      unauthenticated_access_only

  # rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to sign_up_path, alert: "Try again later." }

  # allow_unauthenticated_access only: %i[show create]

  def show
    if current_user
      redirect_to root_path, notice: "you are already sign in"
    else
       @user = User.new
    end
  end

  def create
    @user = User.new(sign_up_params)
    if @user.save
      start_new_session_for(@user)
      # session[:user_id] = @user.id  # Logs in the user
      redirect_to root_path, notice: "logged in succesfully"
    else

    render :show, status: :unprocessable_entity
    end
  end

  private

  def sign_up_params
    # params.expect(user: [ :first_name, :last_name, :email_address, :password, :password_confirmation ])
    params.require(:user).permit(:first_name, :last_name, :email_address, :password, :password_confirmation)
  end

  # def current_user
  #     @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  #   end
end
