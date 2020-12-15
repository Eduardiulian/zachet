require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should save to db' do
    user = User.new(email: 'test@mail.ru', password: '1111', username: 'test' )
    assert user.save
    user.delete
  end

  # test 'check adding not unique value' do
  #   first = User.new(email: 'test@mail.ru', password: '1111', username: 'test' )
  #   first.save
  #   second = User.new(email: 'test@mail.ru', password: '1111', username: 'test' )
  #   second.validate
  #   assert_equal second.errors[:input], ['has already been taken']
  # end
  # test 'test_unique_email' do
  #   instanse1 = User.new(email: 'test@mail.ru', password: '123456', first_name: 'Милохин', last_name: 'Олег')
  #   instanse1.save
  #   instance2 = User.new(email: 'test@mail.ru', password: '222222', first_name: 'Олегин', last_name: 'Милох')
  #   instance2.validate
  #   assert_equal instance2.errors[:email], ['уже существует']
  # end

  test 'should get added data from db' do
    user = User.new(email: 'evgeniy@mail.ru', password: '1111', username: 'Евгений', headline: 'My tube' )
    assert user.save
    assert_equal  'Евгений', User.find_by_email('evgeniy@mail.ru').username
    id = user.id
    assert_equal  'My tube', User.find_by_id(id).headline
  end
end
