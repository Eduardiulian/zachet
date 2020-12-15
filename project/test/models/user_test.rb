require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should save to db' do
    user = User.new(email: 'test@mail.ru', password: '1111', username: 'test' )
    assert user.save
    user.delete
  end

  test 'check adding not unique email' do
    first = User.create email: 'test@mail.ru', password: '1111', username: 'test1'
    first.save
    second = User.create email: 'test@mail.ru', password: '1111', username: 'test2'
    second.validate
    assert_equal second.errors[:email], ['has already been taken']
  end

  test 'check adding not unique username' do
    first = User.create email: 'test1@mail.ru', password: '1111', username: 'test'
    first.save
    second = User.create email: 'test2@mail.ru', password: '1111', username: 'test'
    second.validate
    assert_equal second.errors[:username], ['has already been taken']
  end

  test 'username cant be empty' do
    instance = User.new(email: "test1@mail.ru", password: '1111' )
    instance.validate
    assert_equal instance.errors[:username], ["can't be blank"]
  end

  test 'email cant be empty' do
    instance = User.new(username: "test", password: '1111' )
    instance.validate
    assert_equal instance.errors[:email], ["can't be blank"]
  end

  test 'should get added data from db' do
    user = User.new(email: 'evgeniy@mail.ru', password: '1111', username: 'Евгений', headline: 'My tube' )
    assert user.save
    assert_equal  'Евгений', User.find_by_email('evgeniy@mail.ru').username
    id = user.id
    assert_equal  'My tube', User.find_by_id(id).headline
  end
end
