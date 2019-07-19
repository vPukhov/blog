require 'rails_helper'

feature "Account creation" do
  
  scenario "allows guest to create account" do
    visit new_user_registration_path

    fill_in :user_email, with: 'user@example.com'
    fill_in :user_username, with: 'test_user'
    fill_in :user_password, with: 'qwerty'
    fill_in :user_password_confirmation, with: 'qwerty'

    click_button 'Sign up'

    expect(page).to have_content 'List of articles'

  end  

end