require 'rails_helper'

feature "Contact creation" do
  
  # проверяем доступность страницы '/contacts' 
  scenario "allows accees to contacts page" do
    
    # заходим на страницу
    visit '/contacts'

    expect(page).to have_content I18n.t('contacts.contact_us')    
  end

  # проверка создания
  scenario "allows a guest to create contact" do

    # заходим на страницу
    visit '/contacts'

    # заполнение полей
    fill_in :contact_email, with: 'user@example.com'
    fill_in :contact_message, with: 'test'

    # нажатие кнопки
    click_button 'Send message'

    #проверка
    expect(page).to have_content 'Thanks!'

  end  

end