require 'swagger_helper'

RSpec.describe 'authentication', type: :request do

  path '/auth/login' do

    post('login authentication') do
      consumes 'application/json'
      # parameter username: :token, :in => :header, :type => :string
      parameter username: :users, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string},
          password: {type: :string}
        },
        required: [  'email', 'password' ]
      }

      response '201', 'user created' do
        let(:user) { {  email: 'xyz@gmail.com', password: '1234567' } }
        run_test!
      end
    end
  #     response(200, 'successful') do

  #       after do |example|
  #         example.metadata[:response][:content] = {
  #           'application/json' => {
  #             example: JSON.parse(response.body, symbolize_names: true)
  #           }
  #         }
  #       end
  #       run_test!
  #     end
  #   end
  # end
  end
end
