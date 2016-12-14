module Sinatra
	module App
		module Routing
			module Errors
				def self.registered(app)
					app.error do
						"FOUND AN ERROR IN HOBOKEN"					
					end

					app.not_found do
						halt 404, "That ain't in Hoboken!"
					end
				end
			end
		end
	end
end

