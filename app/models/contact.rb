class Contact < MailForm::Base
    attribute :name,    :validate => true
    attribute :email,   :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
    attribute :phone,   :validate => true
    attribute :message, :validate => true
    
    def headers
        {
            :subject => 'Comentario de un usuario',
            :to => 'runappunal@hotmail.com',
            :from => %("#{name}")
        }
    end
end