def sign_up(email="samedsdad@mail.com")
  visit "/"
  within(:css, "li#signup") do
    click_link('Registrieren')
  end
  fill_in "Email", with: email
  fill_in "user[password]", with: "password"
  fill_in "Passwort bestätigen", with: "password"
  fill_in "Firmenname", with:"Anatoliya GmbH"

  click_button "Registrieren"
  visit '/'
end

def login(email="samedsdad@mail.com")
  visit "/"
  fill_in "Email", with: email
  fill_in "Passwort", with: "password"
  click_button "Login"
end

def create_customer
  sign_up
  click_link 'Kundenliste'
  click_link 'Kunde hinzufügen'
  fill_in 'Name', with: "Damla Baklavalari"
  fill_in 'Email', with: "damla@gmail.com"
  click_button 'Kunde hinzufügen'
end

def add_product(product: "Apple")
  click_link 'Produkt hinzufügen'
  fill_in 'Produktsorte', with: product
  fill_in "Herkunftsland", with: "Uruguay"
  fill_in "Paketgröße", with: "100kg"
  fill_in "Paketpreis", with:"10€"
  fill_in "Produktklasse",with:"1"
  click_button 'Produkt hinzufügen'
end
