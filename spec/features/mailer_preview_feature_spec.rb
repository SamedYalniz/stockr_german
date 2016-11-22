require 'rails_helper'

feature "mailer_preview" do
  scenario "user can preview his mail" do
    sign_up
    add_product
    add_product(product: "Banana")
    create_stock("Banana")
    visit "/"
    click_link "Kundenliste"
    click_link "Email Vorschau"
    expect(page).to have_content "Neuer Lagerbestand von Anatoliya GmbH 22/11/2016 Der Lagerbestand von Anatoliya GmbH wurde aktualisiert. Dies sind die aktuellen Produkte: Produktsorte Herkunftsland Produktklasse Paketgröße Paketpreis Banana Uruguay 1 100kg 10€"
  end
end
