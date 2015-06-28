require 'spec_helper'

describe Demo do
  describe Version_1 do
    describe 'BigData' do
      describe 'get' do
        context 'when required params are set' do
          it 'should return status 200' do
            get '/api/v1/big_data', {type: 'text'}
            expect(response.status).to eq(200)
          end
        end
        context 'when required params are NOT set' do
          it 'should return status 200' do
            get '/api/v1/big_data'
            expect(response.status).to eq(418)
          end
        end
      end

      describe 'post' do
        context 'use inline sample data' do
          it 'should return status 201' do
            cdata = {
                param_1: 'x',
                param_2: 'y',
                param_3: 'z'
            }

            post "/api/v1/big_data", {}, {
                     "RAW_POST_DATA" => cdata.to_json,
                     format: :json}
            expect(response.status).to eq(201)
          end
        end
      end
    end
  end
end