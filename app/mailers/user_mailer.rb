class UserMailer < ApplicationMailer
	default from: 'notifications@fotobook.com'

	def welcome_mail(user)
		@user = user
		#@url  = 'http://example.com/login'
		mail(to: @user.email, subject: 'Welcome to Fotobook')
	end
end
