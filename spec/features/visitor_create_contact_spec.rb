require 'rails_helper'

feature "Contact creation" do
  
  # проверяем доступность страницы '/contacts' 
  scenario "allows acees to contacts page" do
    
    # заходим на страницу
    visit '/contacts'

    expect(page).to have_content I18n.t('contacts.contact_us')    
  end

end