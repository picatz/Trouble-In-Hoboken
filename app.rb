#!/usr/bin/env ruby
#
# ┌┬┐┬─┐┌─┐┬ ┬┌┐ ┬  ┌─┐  ┬┌┐┌  ┬ ┬┌─┐┌┐ ┌─┐┬┌─┌─┐┌┐┌
#  │ ├┬┘│ ││ │├┴┐│  ├┤   ││││  ├─┤│ │├┴┐│ │├┴┐├┤ │││
#  ┴ ┴└─└─┘└─┘└─┘┴─┘└─┘  ┴┘└┘  ┴ ┴└─┘└─┘└─┘┴ ┴└─┘┘└┘
#      --- A vulnerable ruby application. ---
#
# This is a vulnerable ruby web application implemented 
# with Sinatra for our DSL, Thin for our webserver, and
# a MySQL database for our stack. Built for IA 480 --
# they wanted me to write this trash in PHP. Ruby made 
# this job, like, 10x easier. Ruby is amazing.   
#
# Use at your own risk, and be safe!
#
# Author::    Kent 'picat' Gruber
# Copyright:: Copyright (c) 2016 Kent Gruber
# License::   MIT

require 'sinatra/base'
require 'pry'
require 'thin'
require 'mysql'
require 'tilt/erubis'

# Require siantra helpers
require_relative 'helpers/helpers'

# Require sinatra routes
require_relative 'routes/main'
require_relative 'routes/xss'
require_relative 'routes/csrf'
require_relative 'routes/sqli'
require_relative 'routes/client_side'
require_relative 'routes/about'
require_relative 'routes/sessions'
require_relative 'routes/errors'

class VulnerableApplication < Sinatra::Base
 
  SINATRA_QUOTES = [ 
    'The best revenge is massive success.', 
    'Cock your hat - angles are attitudes.', 
    'Hell hath no fury like a hustler with a literary agent.',
    'I\'m not one of those complicated, mixed-up cats.', 
    'You gotta love livin\', baby, \'cause dyin\' is a pain in the ass.', 
    'Alcohol may be man\'s worst enemy, but the bible says love your enemy.',  
  ]

  def sinatra_quote
    SINATRA_QUOTES.sample
  end

  before do 
    headers["x-hoboken"] = sinatra_quote
  end

  configure do
    enable :sessions
    set :environment, :production
    set :bind, '0.0.0.0'
    set :port, 4567
    set :server, :thin
    set :root, File.dirname(__FILE__)
    if server.respond_to? :threaded=
      server.threaded = settings.threaded
    end
    helpers  Sinatra::Helpers
    register Sinatra::App::Routing::Main
    register Sinatra::App::Routing::About
    register Sinatra::App::Routing::Xss
    register Sinatra::App::Routing::ClientSide
    register Sinatra::App::Routing::Csrf
    register Sinatra::App::Routing::SqlInjection
    register Sinatra::App::Routing::Sessions
    register Sinatra::App::Routing::Errors
  end

  def self.run!
    super do |server|
      # stuff before server is started
    end
  end

end

if __FILE__ == $0
  VulnerableApplication.run!
end

