require 'rails_helper'

feature 'product' do
  scenario 'a new product can be added' do
    sign_up
    click_link 'Produkt hinzufügen'
    fill_in 'Produktsorte', with: "Apple"
    fill_in 'Herkunftsland', with: "Uruguay"
    fill_in 'Paketgröße', with: "10kg"
    fill_in 'Paketpreis', with: "12€"
    fill_in 'Produktklasse', with: 1
    click_button 'Produkt hinzufügen'
    expect(page).to have_content("Apple")
    expect(Product.count).to eq 1
  end
  scenario 'a new product cannot  be added without boxsize and country of origin and price for box' do
    sign_up
    click_link 'Produkt hinzufügen'
    fill_in 'Produktsorte', with: "Apple"
    click_button "Produkt hinzufügen"
    expect(Product.count).to eq 0
  end
  scenario 'a product can be editted' do
    sign_up
    add_product
    click_link 'Apple bearbeiten'
    fill_in 'Produktsorte', with: "Banane"
    click_button 'Produkt aktualisieren'
    expect(page).to have_content("Banane")
  end

  scenario 'a product can be deleted' do
    sign_up
    add_product
    click_link 'Apple löschen'
    expect(page).not_to have_content("Apple")
  end

  scenario "user can't see other users products" do
    Product.create(name: "Orange")
    sign_up
    add_product
    expect(page).not_to have_content("Orange")
  end
  scenario "user can search for a product" do
    sign_up
    add_product(product: "Banana")
    add_product(product: "Apple")
    add_product(product: "Potato")
    fill_in "search", with: "Banana"
    click_button "Search"
    expect(page).to have_content "Banana"
    expect(page).to_not have_content "Apple"
    expect(page).to_not have_content "Potato"
  end
end
