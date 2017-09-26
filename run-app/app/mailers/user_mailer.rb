class UserMailer < ApplicationMailer
    def welcome_email(user)
        @user = user
        @name = user.name
        @url = 'https://run-app-miguelangelborja-1.c9users.io/home/entrar'
        #Adjuntar documentos:  attachments["backgroundEmail.jpg"] = File.read("#{Rails.root}/app/assets/images/backgroundEmail.jpg")
        mail(to: user.email, subject: 'Bienvenido a RunApp', from: 'runapp@mysite.com')
    end
    
    def contact_us_email(user)
        mail(to: 'runappunal@gmail.com', subject: 'Quejas y reclamos de ' + user.name, from: user.email)
    end
    
end
