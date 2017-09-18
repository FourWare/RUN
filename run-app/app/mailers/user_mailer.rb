class UserMailer < ApplicationMailer
    def welcome_email(user)
        @user = user
        @url = 'https://run-app-miguelangelborja-1.c9users.io/home/entrar'
        #Adjuntar documentos:  attachments["backgroundEmail.jpg"] = File.read("#{Rails.root}/app/assets/images/backgroundEmail.jpg")
        mail(to: user.email, subject: 'Bienvenido a RunApp', from: 'runapp@mysite.com')
    end
end
