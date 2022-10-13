require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  before(:each) do
    @user = User.new(name: 'Username', email: 'username@gmail.com', password: '123456')
    @user.skip_confirmation!
    @user.save
    @group = Group.create(name: @user.name, icon: 'https://media0.giphy.com/media/3ohhwi25ISXC7Z4tMs/giphy-downsized-medium.gif')
    sign_in(@user)
  end

  it 'Should have a valid value' do
    expect(@user).to be_valid
  end

  it 'Username should be minimum of 5' do
    assert_operator @group.name.length, :>=, 5
  end

  it 'email should be minimum of 5' do
    assert_operator @user.email.length, :>=, 5
  end

  it 'password should be minimum of 6' do
    assert_operator @user.password.length, :>=, 6
  end
end
