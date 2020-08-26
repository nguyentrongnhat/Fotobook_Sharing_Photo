class UsersUpdateController < ApplicationController
	def update
		@user = User.find(params[:id])
		if @user.update(param_permit_update)
			flash[:notice] = "Photo have successfully edit."
			redirect_to profiles_path(current_user.id)
		else
			render "devise/registrations#edit"
		end
	end

	def avatar
		@user = User.find(params[:id])
		if @user.update(param_permit_update_avatar)
			flash[:notice] = "Photo have successfully edit."
			redirect_to profiles_path(current_user.id)
		else
			render "devise/registrations#edit"
		end
	end

  private   
    def param_permit_update
      params.require(:user).permit :lastname, :firstname, :email
    end

    def param_permit_update_avatar
      params.require(:user).permit :avatar
    end

	def send_mail(user)
		JobSendMailJob.set(wait: 3.seconds).perform_later(user)
	end
end
