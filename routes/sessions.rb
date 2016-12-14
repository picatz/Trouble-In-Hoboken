module Sinatra
  module App
    module Routing
      module Sessions
        def self.registered(app)

          app.get '/login' do
            erb :login
          end

          app.post '/login' do
            session[:user] = true
            erb :index
          end

          app.get '/logout' do
            session.delete(:user)
            erb :index
          end
        end
      end
    end
  end
end
