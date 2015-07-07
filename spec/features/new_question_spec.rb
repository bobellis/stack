require 'rails_helper'

describe 'the new question process' do
  it 'adds a new question' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Log in'
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_button 'Log in'
    click_link 'Add a new question'
    fill_in 'Text', :with => 'How do you hamster?'
    click_button 'Create Question'
    expect(page).to have_content 'Questions'
  end
end
