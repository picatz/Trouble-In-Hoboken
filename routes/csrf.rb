module Sinatra
  module App 
    module Routing
      module Csrf

        def self.registered(app)
          
          app.get '/csrf' do
            require 'pry'
            binding.pry
          end

        end

      end
    end
  end
end

