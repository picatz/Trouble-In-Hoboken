module Sinatra
  module App 
    module Routing
      module Main 

        def self.registered(app)
          app.get '/' do
            erb :index  
          end

          app.get '/about' do
            erb :about
          end

          app.get '/xss' do
            if params[:stuff]
              response.set_cookie 'vulnerable', cookies["rack.session"]
              @stuff = params[:stuff]
            else
              @stuff = "You got the stuff?"
            end
            erb :reflected_xss
          end

          # post '/sql_login' do
          #   if user_login(params)
          #     session[:user_name] = params["user_name"]
          #     @session = session
          #     @user_first_name = get_user_first_name(session)
          #     @user_last_name = get_user_last_name(session)
          #     erb :sql_logged_in
          #   else
          #     @failed = true
          #     erb :sql_login
          #   end 
          # end

          # get '/sql_login' do
          #   erb :sql_login
          # end

          app.get '/fake_login' do
            # serve static file via public directory
            File.read(File.join('public', 'fake_login.html'))
          end
        end

      end
    end
  end
end

