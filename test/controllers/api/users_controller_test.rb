require 'test_helper'

class Api::UsersControllerTest < ActionDispatch::IntegrationTest
  test 'POST creates a user' do
    assert_difference 'User.count' do
      post api_users_path, params: { email: 'tom@buzztask.com', password: 'password' }
    end

    assert_equal 201, response.status
    assert_equal UserSerializer.new(User.last).serialized_json, response.body
  end

  test 'POST returns error if email is taken' do
    existing = create(:user)

    assert_no_difference 'User.count' do
      post api_users_path, params: { email: existing.email, password: 'password' }
    end

    json = JSON.parse(response.body).with_indifferent_access

    assert_equal 422, response.status
    assert_equal 'Email has already been taken', json[:errors][0][:detail]
  end

  test 'POST returns error if password is too short' do
    assert_no_difference 'User.count' do
      post api_users_path, params: { email: 'tom@buzztask.com', password: '123' }
    end

    json = JSON.parse(response.body).with_indifferent_access

    assert_equal 422, response.status
    assert_equal 'Password is too short (minimum is 8 characters)', json[:errors][0][:detail]
  end
end
