require 'rails_helper'

feature "Account creation" do
  
  scenario "allows guest to create account" do
    
    sign_up
    expect(page).to have_content 'List of articles'

  end  

end
  