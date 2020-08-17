class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new param_permit
  	if @user.save
  		flash[:create_user_sucess] = "create sucess fullly"
  		send_mail(@user)
  		#UserMailer.with(:user: @user).welcome_mail.deliver_now
  		#render "welcome"
      redirect_to photos_path
  	else
  		render "new"
  	end	
  end

  private
    def param_permit
      params.require(:user).permit :firstname, :lastname, :pass, :pass_confirmation, :email
    end

   def welcome
   	
   end

   def send_mail(user)
    JobSendMailJob.set(wait: 3.seconds).perform_later(user)
   end
end
