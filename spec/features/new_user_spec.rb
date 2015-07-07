require 'rails_helper'

  describe "the new user process" do
    it "adds a new user" do
      visit root_path
      fill_in 'Email', :with => "david@aol.com"
      fill_in 'Password', :with => "password"
      fill_in 'Password confirmation', :with => "password"
      click_on 'Sign Up'
      expect(page).to have_content 'Welcome to the site!'
    end
  end

  describe "the login process" do
    it "logs in a user" do
      user = FactoryGirl.create(:user)
      visit root_path
      click_link 'Log in'
      fill_in 'Email', :with => user.email
      fill_in 'Password', :with => user.password
      click_button 'Log in'
      expect(page).to have_content 'Questions'
    end
  end
