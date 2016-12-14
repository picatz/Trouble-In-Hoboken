module Sinatra
  module App 
    module Routing
      module SqlInjection 

        def self.registered(app)
          
          app.get '/sqli' do
            # sql injection code here
            "do this"
          end

        end

      end
    end
  end
end

