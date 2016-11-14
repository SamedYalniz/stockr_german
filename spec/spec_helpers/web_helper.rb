def sign_up(email="samedsdad@mail.com")
  visit "/"
  within(:css, "li#signup") do
    click_link('Registrieren')
  end
  fill_in "Email", with: email
  fill_in "Password", with: "password"
  fill_in "Password confirmation", with: "password"
  fill_in "Company name", with:"Anatoliya GmbH"
  fill_in "Description", with: "a company existing since 1990"
  fill_in "Street", with: "Marktstr. 9"
  fill_in "City", with:"Cologne"
  fill_in "Postcode", with:"50968"
  fill_in "Country", with: "Germany"
  fill_in "Contact number", with: "074000000"

  click_button "Sign up"
  visit '/'
end

def login(email="samedsdad@mail.com")
  visit "/"
  fill_in "Email", with: email
  fill_in "Password", with: "password"
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
