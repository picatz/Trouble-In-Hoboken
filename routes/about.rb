module Sinatra
  module App 
    module Routing
      module About 

        def self.registered(app)

          app.get '/about' do
            erb :about
          end

          app.get '/client_about' do
            erb :client_about
          end

          app.get '/sqli_about' do
            erb :sqli_about
          end

          app.get '/xss_about' do
            erb :xss_about
          end

          app.get '/csrf_about' do
            erb :csrf_about
          end
        end

      end
    end
  end
end

