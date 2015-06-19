require 'grape-swagger'
module Demo
  class Root < Grape::API
    prefix 'api'

    helpers do
      include GrapeHelper

    end

    mount Demo::Version_1::Root

    add_swagger_documentation base_path: "/api",
                              api_version: 'v1',
                              hide_documentation_path: true

  end
end