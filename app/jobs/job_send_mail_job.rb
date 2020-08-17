class JobSendMailJob < ApplicationJob
  queue_as :default

  def perform(user)
  	@user = user
    UserMailer.welcome_mail(@user).deliver
  end
end
