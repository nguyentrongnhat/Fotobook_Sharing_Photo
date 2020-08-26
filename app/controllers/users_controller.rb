class UsersController < ApplicationController
  
  def update
    @user = User.find(params[:id])
    byebug
    if @user.update(param_permit_update)
      flash[:notice] = "Photo have successfully edit."
      redirect_to profile_path(current_user.id)
    else
      render "devise/registrations#edit"
    end
  end

  private
    
    def param_permit_update
      params.require(:user).permit (:firstname, :lastname, :email)
    end

   def send_mail(user)
    JobSendMailJob.set(wait: 3.seconds).perform_later(user)
   end
end
