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
  scenario "user can create a stocklist and sees all attributes of a product" do
    sign_up
    add_product
    visit '/'
    click_link 'Aktueller Lagerbestand'
    click_link 'Produkt zum Lagerbestand hinzufügen'
    expect(page).to have_content("Apple | Herkunftsland: Uruguay | Paketgröße: 100kg | Paketpreis: 10€ | Produktklasse: 1")
    page.check("Apple")
    click_button "Zum Lagerbestand hinzufügen"
    expect(page).to have_content("Apple | Herkunftsland: Uruguay | Paketgröße: 100kg | Paketpreis: 10€ | Produktklasse: 1")

  end

  scenario"user can see link to current_stock in the profile of users" do
    sign_up
    add_product
    visit "/"
    click_link "Aktueller Lagerbestand"
    click_link "Produkt zum Lagerbestand hinzufügen"
    page.check "Apple"
    click_button "Zum Lagerbestand hinzufügen"
    click_link "Mein Profil"
    expect(page).to have_link "Der aktuelle Lagerbestand"
    click_link "Der aktuelle Lagerbestand"
    expect(page).to have_content("Apple | Herkunftsland: Uruguay | Paketgröße: 100kg | Paketpreis: 10€ | Produktklasse: 1")

  end



end
