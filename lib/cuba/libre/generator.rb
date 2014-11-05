#!/usr/bin/env ruby
require 'securerandom'

def setup_cuba
<<-EOF
require 'cuba'

# If you need extra protection.
# require 'rack/protection'
# Cuba.use Rack::Protection
# Cuba.use Rack::Protection::RemoteReferrer

Cuba.use Rack::Session::Cookie, :secret => "#{SecureRandom.base64(128)}"

# Cuba includes a plugin called Cuba::Render that provides a couple of helper methods for rendering templates.
# require "cuba/render"
# Cuba.plugin(Cuba::Render)

# This plugin uses Tilt, which serves as an interface to a bunch of different Ruby template engines
# (ERB, Haml, Sass, CoffeeScript, etc.), so you can use the template engine of your choice.
# require 'slim'
# Cuba.settings[:render][:template_engine] = 'slim'

# Cuba.settings[:render][:template_engine] = "slim"
# Cuba.settings[:render][:views] = "./views/admin/"
# Cuba.settings[:render][:layout] = "admin"

# To launch just type: 'rackup' in your console
Cuba.define do
  on get do
    on "#{ARGV[1]}" do
      on root do
        res.write 'Hello world!'
      end
    end

    on root do
      res.redirect "/#{ARGV[1]}"
    end
  end
end
EOF
end

def setup_config
<<-EOF
require "./#{ARGV[1]}"

run Cuba
EOF
end

def create_config
  File.open("./project_dir/config.ru", 'w+') do |file|
    file.write setup_config
  end
end

def create_cuba
  File.open("./project_dir/#{ARGV[1]}.rb", 'w+') do |file|
    file.write setup_cuba
  end
end

if ARGV.length == 2 && ARGV[0] == 'new'
  project_dir = ARGV[1].downcase
  Dir.mkdir(project_dir)
  create_cuba
  create_config
else
  puts "cuba new <projectName>"
end
