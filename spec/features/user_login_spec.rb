require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  # SETUP
  before :each do
    @user = User.create! first_name: "Julia", last_name: "J", email: "email@email.com", password: "password", password_confirmation: "password"
  end

  scenario "Users can login successfully and are taken to the home page once they are signed in." do
    # ACT
    visit '/login'
    
    fill_in "email", with: @user.email
    fill_in "password", with: @user.password
    click_on "Submit"
    
    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_content 'Logout'

  end
end
