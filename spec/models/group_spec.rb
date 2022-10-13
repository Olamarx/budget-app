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
    @group.id = 1
    @group.user_id = @user.id

    expect(@group).to be_valid
  end

  it 'icon is required' do
    @group.icon = 'www.google.com'
    expect(@group).to_not be_valid
  end
end
