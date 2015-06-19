module Demo
  module Version_1
    class BigData < Grape::API
      version 'v1'
      format :json

      desc 'BigData operations'
      namespace :big_data do

        desc 'Store incoming data'
        post do
          success
        end

        desc 'Read data by parameters'
        params do
          requires :type, type: String, values: ['text', 'image', 'video'], desc: 'text | image | video'
          optional :limit, type: Integer, desc: "default: '1000'"
          optional :offset, type: Integer, desc: "default: '0'"
          optional :date_start, type: String, desc: 'from date'
          optional :date_end, type: String, desc: 'to date'
        end
        get do
          success
        end

      end
    end
  end
end

