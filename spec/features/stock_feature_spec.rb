require 'rails_helper'

feature 'Stock list' do
  scenario 'user can create a stocklist' do
    sign_up
    add_product(product: "Orange")
    add_product
    visit '/'
    click_link 'Aktueller Lagerbestand'
    click_link 'Produkt zum Lagerbestand hinzufügen'
    page.check('Orange')
    click_button 'Zum Lagerbestand hinzufügen'
    expect(page).to have_content('Orange')
    expect(page).not_to have_content('Apple')
  end


end
