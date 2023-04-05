require 'swagger_helper'

RSpec.describe 'users', type: :request do
 
  path '/users' do
    
    get('list users') do
      parameter name: :token, :in => :header, :type => :string
      response(200, 'successful') do
        let!(:token) { jwt_token }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create user') do
      parameter name: :token, :in => :header, :type => :string
      consumes 'application/json'
      # parameter username: :token, :in => :header, :type => :string
      parameter username: :users, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string },
          email: { type: :string},
          password: {type: :string}
        },
        required: [ 'username', 'email', 'password' ]
      }

      response '201', 'user created' do
        let(:user) { { username: 'foo', email: 'xyz@gmail.com', password: '1234567' } }
        run_test!
      end

      # response '422', 'invalid request' do
      #   let(:user) { { username: 'foo', email: 'xyz@gmail.com', password: '1234567' } }
      #   run_test!
      # end
    end
      # response(200, 'successful') do

      #   after do |example|
      #     example.metadata[:response][:content] = {
      #       'application/json' => {
      #         example: JSON.parse(response.body, symbolize_names: true)
      #       }
      #     }
      #   end
      #   run_test!
      # end
    # end
  end

  path '/users/new' do

    get('new user') do
      parameter name: :token, :in => :header, :type => :string
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/users/{_username}/edit' do
    # You'll want to customize the parameter types...
    parameter name: '_username', in: :path, type: :string, description: '_username'

    get('edit user') do
      parameter name: :token, :in => :header, :type => :string
      response(200, 'successful') do
        let(:_username) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/users/{_username}' do
    # You'll want to customize the parameter types...
    parameter name: '_username', in: :path, type: :string, description: '_username'

    get('show user') do
      parameter name: :token, :in => :header, :type => :string
      response(200, 'successful') do
        let(:_username) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    patch('update user') do
      parameter name: :token, :in => :header, :type => :string
      response(200, 'successful') do
       
        # let(:_username) { '123' }
        let!(:token) { jwt_token }
      end
        consumes 'application/json'
        parameter username: :users, in: :body, schema: {
          type: :object,
          properties: {
            username: { type: :string },
            email: { type: :string},
            password: {type: :string}
          },
          required: [ 'username', 'email', 'password' ]
        }
  
        response '201', 'user created' do
          let(:user) { { username: 'foo', email: 'xyz@gmail.com', password: '1234567' } }
          run_test!
        end
        # after do |example|
        #   example.metadata[:response][:content] = {
        #     'application/json' => {
        #       example: JSON.parse(response.body, symbolize_names: true)
        #     }
        #   }
        # end
        # run_test!
      # end
    end

    put('update user') do
      parameter name: :token, :in => :header, :type => :string
      response(200, 'successful') do
       
        # let(:_username) { '123' }
        let!(:token) { jwt_token }
      end
        consumes 'application/json'
        parameter username: :users, in: :body, schema: {
          type: :object,
          properties: {
            username: { type: :string },
            email: { type: :string},
            password: {type: :string}
          },
          required: [ 'username', 'email', 'password' ]
        }
  
        response '201', 'user created' do
          let(:user) { { username: 'foo', email: 'xyz@gmail.com', password: '1234567' } }
          run_test!
        end
      # response(200, 'successful') do
      #   let(:_username) { '123' }

      #   after do |example|
      #     example.metadata[:response][:content] = {
      #       'application/json' => {
      #         example: JSON.parse(response.body, symbolize_names: true)
      #       }
      #     }
      #   end
      #   run_test!
      # end
    end

    delete('delete user') do
      parameter name: :token, :in => :header, :type => :string
      response(200, 'successful') do
        let(:_username) { '123' }
        let!(:token) { jwt_token }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
