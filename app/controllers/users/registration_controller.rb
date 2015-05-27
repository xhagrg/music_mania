class Users::RegistrationController < Devise::RegistrationsController
  def create
    user = params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation,:email)
    user = User.new(user)
    if user.save
      sign_in(user)
      redirect_to root_path, notice: 'User successfully created.'
    else
      redirect_to :back, alert: user.errors.full_messages.join(', ')
    end
  end
  def new
    super
  end

end
