module Sinatra
  module App 
    module Routing
      module Xss 

        def self.registered(app)
          
          app.get '/reflected_xss' do
            if params[:stuff]
              #binding.pry
              response.set_cookie("vulnerable", :value => "leave the vulnerable cookies alone!")
              @stuff = params[:stuff]
            else
              @stuff = "You got the stuff?"
            end
            erb :reflected_xss
          end

        end

      end
    end
  end
end

