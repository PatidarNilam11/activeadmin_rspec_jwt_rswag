require 'swagger_helper'

RSpec.describe 'students', type: :request do

  path '/students' do

    get('list students') do
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

    post('create student') do
      parameter name: :token, :in => :header, :type => :string
      consumes 'application/json'
      parameter name: :blog, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          age: { type: :integer},
          roll_no: {type: :integer}
        },
        required: [ 'name', 'age', 'roll_no' ]
      }

      response '201', 'student created' do
        let(:blog) { { name: 'foo', age: 10, roll_no: 22 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:blog) { { name: 'foo' , age: 10, roll_no: 22} }
        run_test!
      end
    end
      # response(200, 'successful') do
        
    #     after do |example|
    #       example.metadata[:response][:content] = {
    #         'application/json' => {
    #           example: JSON.parse(response.body, symbolize_names: true)
    #         }
    #       }
    #     end
    #     run_test!
    #   end
    # end
  end

  path '/students/new' do
    parameter name: :token, :in => :header, :type => :string
    get('new student') do
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

  path '/students/{id}/edit' do
    parameter name: :token, :in => :header, :type => :string
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('edit student') do
      response(200, 'successful') do
        let(:id) { '123' }

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

  path '/students/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show student') do
      response(200, 'successful') do
        let(:id) { '123' }

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

    patch('update student') do
      parameter name: :token, :in => :header, :type => :string
      response(200, 'successful') do
        let(:id) { '123' }
       
        consumes 'application/json'
        parameter name: :blog, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            age: { type: :integer},
            roll_no: {type: :integer}
          },
          required: [ 'name', 'age', 'roll_no' ]
        }

        response '201', 'student created' do
          let(:blog) { { name: 'foo', age: 10, roll_no: 22 } }
          run_test!
        end

        response '422', 'invalid request' do
          let(:blog) { { name: 'foo' , age: 10, roll_no: 22} }
          run_test!
        end
      end
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

    put('update student') do
     parameter name: :token, :in => :header, :type => :string
      response(200, 'successful') do
        let(:id) { '123' }

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

    delete('delete student') do
      response(200, 'successful') do
        let(:id) { '123' }

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
