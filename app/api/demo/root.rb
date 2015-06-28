require 'grape-swagger'
module Demo
  class Root < Grape::API
    prefix 'api'

    rescue_from :all do |e|
      # Rollbar.warning("API returned code 418", e) if Rails.env.production?
      if Rails.env.test?
        puts '=============== EXCEPTION =================='
        puts e.inspect
        puts '=============== BACKTRACE =================='
        # grape-api is the part of the current name of the project
        #                                       |
        puts e.backtrace.select { |x| x.match(/grape-api/) }
        puts '===============    END    =================='
      end

      Rack::Response.new({status_code: 418,
                          error_code: "4018",
                          detail: e.message
                         }.to_json, 418)
    end

    helpers do
      include GrapeHelper

    end

    mount Demo::Version_1::Root

    add_swagger_documentation api_version: 'v1',
                              hide_documentation_path: true

  end
end