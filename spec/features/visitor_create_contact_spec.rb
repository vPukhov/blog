require 'rails_helper'

feature "Contact creation" do
  
  # проверяем доступность страницы '/contacts' 
  scenario "allows acees to contacts page" do
    # заходим на страницу
    visit '/contacts'

    expect(page).to have_content 'Contact us'    
  end  
end