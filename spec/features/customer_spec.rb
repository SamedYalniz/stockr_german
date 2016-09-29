require 'rails_helper'

feature 'customer' do
  scenario'logged in user can create a customer' do
    create_customer
    expect(page).to have_content("Damla Baklavalari")
    expect(page).to have_content("damla@gmail.com")
  end

  scenario'logged in user can edit a customer' do
    create_customer
    click_link 'Damla Baklavalari bearbeiten'
    fill_in 'Email', with: 'damlabaklavalari@gmail.com'
    click_button 'Kundendaten aktualisieren'
    expect(page).to have_content('damlabaklavalari@gmail.com')
    expect(page).not_to have_content("damla@gmail.com")
  end

  scenario 'logged in user can delete a customer' do
    create_customer
    click_link 'Damla Baklavalari löschen'
    expect(page).not_to have_content('Damla Baklavalari')
  end

  scenario 'logged in user can delete a customer' do
    create_customer
    click_link 'Damla Baklavalari löschen'
    expect(page).not_to have_content('Damla Baklavalari')
  end

  # scenario 'logged in user is sending an email' do
  #   create_customer
  #   expect {click_link 'Send stock update'}
  #   .to change  { ActionMailer::Base.deliveries.count }.by(1)
  # end
end
