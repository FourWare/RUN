OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '273132930287-9gput2ek3b2innodqblf9j36lc7diitm.apps.googleusercontent.com', 'fi1AP5EYQz5eLsV9j4fiT4kw',
            { scope: ['email', 'https://www.googleapis.com/auth/userinfo.email'],
                access_type: 'offline'}
end