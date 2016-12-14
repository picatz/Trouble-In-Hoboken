module Sinatra
  module App 
    module Routing
      module ClientSide 

        def self.registered(app)
          
          app.get '/client_side' do
            erb :client_side
          end

        end

      end
    end
  end
end

