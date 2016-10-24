def sign_up(email="samedsdad@mail.com")
  visit "/"
  within(:css, "li#signup") do
    click_link('Registrieren')
  end
  fill_in "Email", with: email
  fill_in "Password", with: "password"
  fill_in "Password confirmation", with: "password"
  click_button "Sign up"
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
