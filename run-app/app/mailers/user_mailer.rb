class UserMailer < ApplicationMailer
    def welcome_email(user)
        @user = user
        @url = 'https://run-app-miguelangelborja-1.c9users.io/home/entrar'
        mail(to: user.email, subject: 'Bienvenido a RunApp', from: 'runapp@mysite.com')
    end
end
