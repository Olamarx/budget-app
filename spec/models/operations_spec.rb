require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  before(:each) do
    @user = User.new(name: 'Username', email: 'username@gmail.com', password: '123456')
    @user.skip_confirmation!

    @user.save
    @group = Group.create(name: @user.name, icon: 'https://media0.giphy.com/media/3ohhwi25ISXC7Z4tMs/giphy-downsized-medium.gif')
    @operation = Operation.create(id: 1, name: @group.name, amount: 20, author_id: @user.id)
    sign_in(@user)
  end

  it 'Should have a valid value' do
    expect(@operation).to be_valid
  end

  it 'amount is a number and not a string' do
    check = @operation.amount.is_a? Integer
    expect(check).to be_truthy
  end
end
