class Api < Grape::API
  prefix 'api'
  formatter :json, Grape::Formatter::Rabl

  helpers do
    def warden
      env['warden']
    end

    def authenticated?
      if warden.authenticated?
        return true
      elsif params[:auth_token] and
          User.find_by_authentication_token(params[:auth_token])
        return true
      else
        error!({"error" => "Unauth 401. Token invalid or expired"}, 401)
      end
    end

    def current_user
      warden.user ||  User.find_by_authentication_token(params[:auth_token])
    end
  end
  desc "authenticated call"
  get :test do
    authenticated?
    "you are authenticated"
  end
  #mount Acme::Ping
  #mount Acme::Raise
  #mount Acme::Protected
  #mount Acme::Post
  mount Console
end