require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'validate email format' do
    user = build(:user, email: 'foo')
    refute_predicate user, :valid?
    assert_equal 'is invalid', user.errors[:email][0]

    user.email = 'tom@tom.com'
    assert_predicate user, :valid?
  end

  test '#email= downcases email' do
    assert_equal 'tom@tom.com', User.new(email: 'TOM@TOM.com').email
  end

  test '#email= strips whitespace from email' do
    assert_equal 'tom@tom.com', User.new(email: '    tom@tom.com    ').email
  end

  test 'user is unique on email' do
    existing_user = create(:user)
    new_user = build(:user, email: existing_user.email)

    refute new_user.valid?
    assert_equal 'has already been taken', new_user.errors[:email][0]
  end

  test 'validate password is not less than 8 characters' do
    # arbitary number we can revist
    user = build(:user, password: '1234567')
    refute_predicate user, :valid?
    assert_equal 'is too short (minimum is 8 characters)', user.errors[:password][0]

    user.password = '12345678'
    assert_predicate user, :valid?
  end
end
