require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  before(:each) do
    @user = User.new(name: 'Username', email: 'username@gmail.com', password: '123456')
    @user.skip_confirmation!
    @user.save
    @group = Group.create(name: @user.name, icon: 'https://media0.giphy.com/media/3ohhwi25ISXC7Z4tMs/giphy-downsized-medium.gif')
    sign_in(@user)
    visit '/'
  end

  it 'Redirected to /groups/new after clicking on New and returns to home page' do
    click_on('New')
    expect(page.body).to include('New Group')
    expect(current_path).to eq('/groups/new')
    click_on('Previous page')
    expect(page.body).to include('Group')
    expect(current_path).to eq('/')
  end

  it 'Redirected to /operations/new after clicking on New' do
    click_on('New Operation')
    expect(page.body).to include('New operation')
    expect(page.body).to include('Save')
    expect(page.body).to include('Groups')
    expect(current_path).to eq('/operations/new')
    click_on('Previous Page')
    expect(page.body).to include('Group')
    expect(current_path).to eq('/')
  end
end
