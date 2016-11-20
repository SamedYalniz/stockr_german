require "rails_helper"

feature "sign in" do

  context "user doesn't have an account" do

    scenario "user is directed to sign up form after trying to log in" do
      visit "/"
      fill_in "Email", with: "samedsdad@mail.com"
      fill_in "Passwort", with: "password"
      click_button "Anmelden"
      expect(page).to have_content "Sign up"
    end

    scenario "user can sign up using form" do
      sign_up
      expect(page).to have_content "samedsdad@mail.com"
    end
    scenario "user can add a description about himself during the sign up process" do
      visit "/users/sign_up"
      fill_in "Email", with: "samedsdad@mail.com"
      fill_in "user[password]", with: "password"
      fill_in "Passwort bestätigen", with: "password"
      fill_in "Firmenname", with: "Anatoliya"
      click_button "Registrieren"
      expect(page).to have_content ("Abmelden")
    end
    scenario "user can add his street, city and country during the sign up process" do
      visit "/users/sign_up"
      fill_in "Email", with: "samedsdad@mail.com"
      fill_in "user[password]", with: "password"
      fill_in "Passwort bestätigen", with: "password"
      fill_in "Firmenname", with:"Anatoliya"
      click_button "Registrieren"
      expect(page).to have_content("Abmelden")
    end

  end

  context "user can create an account" do
    before do
      visit "/users/sign_up"
      fill_in "Email", with: "samedsdad@mail.com"
      fill_in "user[password]", with: "password"
      fill_in "Passwort bestätigen", with: "password"
      fill_in "Firmenname", with:"Anatoliya GmbH"
      fill_in "Straße", with:"Marktstr. 9"
      fill_in "Stadt", with: "Cologne"
      fill_in "Land", with:"Germany"
      fill_in "PLZ", with: "50968"
      fill_in "Beschreibung", with:"company existing since 1990"
      fill_in "Telefonnummer", with: "074000000"
      click_button "Registrieren"
    end

    scenario "user can login" do
      click_link "Abmelden"
      visit "/"
      fill_in "Email", with: "samedsdad@mail.com"
      fill_in "Passwort", with: "password"
      click_button "Anmelden"
      expect(page).to have_content "samedsdad@mail.com"
    end

    scenario "user can see sign out link" do
      expect(page).to have_link "Abmelden"
    end

    scenario "user can visit his profile" do
      click_link("Mein Profil")
      expect(page).to have_content ("Beschreibung")
    end
    xscenario "user can see his address on his profile" do
      click_link("Mein Profil")
      expect(page).to have_content("Marktstr. 9")
      expect(page).to have_content("Cologne 50968")
      expect(page).to have_content("Germany")
    end
    scenario "user can see his company name on his profile" do
      click_link("Mein Profil")
      expect(page).to have_content("Anatoliya GmbH")
    end
    xscenario "user can see his contact number on his profile" do
      click_link("Mein Profil")
      expect(page).to have_content("074000000")
    end
  end
  context "user can edit his profile" do
    before do
      visit "/users/sign_up"
      fill_in "Email", with: "samedsdad@mail.com"
      fill_in "user[password]", with: "password"
      fill_in "Passwort bestätigen", with: "password"
      fill_in "Firmenname", with:"Anatoliya GmbH"
      fill_in "Straße", with:"Marktstr. 9"
      fill_in "Stadt", with: "Cologne"
      fill_in "Land", with:"Germany"
      fill_in "PLZ", with: "50968"
      fill_in "Beschreibung", with:"company existing since 1990"
      fill_in "Telefonnummer", with: "074000001"
      click_button "Registrieren"
      click_link "Mein Profil"
    end
    xscenario "user can edit his company name, description, address(street, city, postcode, country and contact number)" do
      click_link "Informationen bearbeiten"
      fill_in "Current password", with: "password"
      fill_in "Company name", with:"Anatolia"
      fill_in "Description", with: "a company existing since 1989"
      fill_in "Street", with: "Marktstr. 7"
      fill_in "City", with:"Düsseldorf"
      fill_in "Postcode", with:"50967"
      fill_in "Country", with: "German"
      fill_in "Contact number", with: "074000001"
      click_button "Update"
      expect(page).to have_content ("company existing since 1989")
      expect(page).to have_content ("Address: Marktstr. 7 Düsseldorf 50967 German")
      expect(page).to have_content("074000001")
    end
    scenario "user can add a company picture to his profile" do
      click_link "Mein Profil"
      page.attach_file('user[image]', Rails.root + 'app/assets/images/company.jpeg')
      click_button 'Bild hochladen'
      expect(page).to have_xpath('//img[contains(@src,"company.jpeg")]')
    end
    scenario "user can search for other users" do
      click_link "Abmelden"
      sign_up("cengiz@cengiz.com")
      visit "/"
      fill_in "search_company", with: "Anatoliya"
      click_button "Suchen"
      expect(page).to have_content("Anatoliya GmbH Anatoliya GmbH")
    end
    scenario "user can search for a user and click on its name to see his profile" do
      click_link "Abmelden"
      sign_up ("cengiz@cengiz.com")
      visit "/"
      fill_in "search_company", with: "Anatoliya"
      click_button "Suchen"
      within (".user_search_results") do
        first(:link).click
      end
      expect(page).to have_content("Anatoliya GmbH")
    end
  end
end
