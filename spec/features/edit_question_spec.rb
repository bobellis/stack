require 'rails_helper'

describe 'the edit question process' do
  it 'edits a question' do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question)
    visit root_path
    click_link 'Log in'
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_button 'Log in'
    click_link question.text
    click_link 'Edit question'
    fill_in 'Text', :with => 'How do I dog?'
    click_button 'Update Question'
    expect(page).to have_content 'How do I dog?'
  end
end
