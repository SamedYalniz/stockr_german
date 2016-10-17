require "rails_helper"

feature "sign in" do

  context "user doesn't have an account" do

    scenario "user is directed to sign up form after trying to log in" do
      visit "/"
      fill_in "Email", with: "samedsdad@mail.com"
      fill_in "Password", with: "password"
      click_button "Log in"
      expect(page).to have_content "Sign up"
    end

    scenario "user can sign up using form" do
      sign_up
      expect(page).to have_content "Eingeloggt als samedsdad@mail.com"
    end
    scenario "user can add a description about himself during the sign up process" do
      visit "/users/sign_up"
      fill_in "Email", with: "samedsdad@mail.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      fill_in "Description", with: "a company existing since 1990"
      click_button "Sign up"
      expect(page).to have_content ("Abmelden")
    end
    scenario "user can add his street, city and country during the sign up process" do
      visit "/users/sign_up"
      fill_in "Email", with: "samedsdad@mail.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      fill_in "Street", with: "Marktstr. 9"
      fill_in "City", with:"Cologne"
      fill_in "Country", with: "Germany"

      click_button "Sign up"
      expect(page).to have_content("Abmelden")
    end

  end

  context "user can create an account" do
    before do
      visit "/users/sign_up"
      fill_in "Email", with: "samedsdad@mail.com"
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
    end

    scenario "user can login" do
      click_link "Abmelden"
      visit "/"
      fill_in "Email", with: "samedsdad@mail.com"
      fill_in "Password", with: "password"
      click_button "Log in"
      expect(page).to have_content "Eingeloggt als samedsdad@mail.com"
    end

    scenario "user can see sign out link" do
      expect(page).to have_link "Abmelden"
    end

    scenario "user can visit his profile" do
      click_link("Mein Profil")
      expect(page).to have_content ("company existing since 1990 ")
    end
    scenario "user can see his address on his profile" do
      click_link("Mein Profil")
      expect(page).to have_content("Address: Street: Marktstr. 9 City: Cologne Postcode: 50968 Country: Germany")
    end
    scenario "user can see his company name on his profile" do
      click_link("Mein Profil")
      expect(page).to have_content("Anatoliya GmbH")
    end
    scenario "user can see his contact number on his profile" do
      click_link("Mein Profil")
      expect(page).to have_content("074000000")
    end
  end
  context "user can edit his profile" do
    before do
      visit "/users/sign_up"
      fill_in "Email", with: "samedsdad@mail.com"
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
      click_link "Mein Profil"
    end
    scenario "user can edit his company name, description, address(street, city, postcode, country and contact number)" do
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
      expect(page).to have_content ("Address: Street: Marktstr. 7 City: Düsseldorf Postcode: 50967 Country: German")
      expect(page).to have_content("074000001")


    end
  end
end
