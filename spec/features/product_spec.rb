require 'rails_helper'

feature 'product' do
  scenario 'a new product can be added' do
    sign_up
    click_link 'Add a product'
    fill_in 'Name', with: "Apple"
    click_button 'Create Product'
    expect(page).to have_content("Apple")
    expect(Product.count).to eq 1
  end
  scenario 'a new product can be added with boxsize and country of origin and price for box' do
    sign_up
    click_link 'Add a product'
    fill_in 'Name', with: "Apple"
    fill_in 'Country of origin', with: "Uruguay"
    fill_in 'Boxsize', with: "10kg"
    fill_in 'Boxprice', with: "12€"
    fill_in 'Product class', with: 1
    click_button "Create Product"
    expect(page).to have_content("Apple | Country of origin: Uruguay | Boxsize: 10kg | Price per Box: 12€ | Class: 1")
    expect(Product.count).to eq 1
  end
  scenario 'a product can be editted' do
    sign_up
    add_product
    click_link 'Edit Appl'
    fill_in 'Name', with: "Apple"
    click_button 'Update Product'
    expect(page).to have_content("Apple")
  end

  scenario 'a product can be deleted' do
    sign_up
    add_product
    click_link 'Delete Apple'
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
