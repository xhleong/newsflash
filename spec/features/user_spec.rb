require 'rails_helper'

feature "Sign Up" do

  scenario "User signs up with unique email" do
    visit '/signup'
    fill_in 'user[name]', with: 'Xin'
    fill_in 'user[email]', with: 'Xin@123.com'
    fill_in 'user[password]', with: '123'
    click_button 'Create User'
    expect(page).to have_text "DASHBOARD" 
  end

  describe "Failed login" do
    before do
      User.create(name: 'abc', email: 'Xin@123.com', password:'456')
    end

    scenario "User signs up with existing email" do

      
      visit '/signup'
      fill_in 'user[name]', with: 'Xin'
      fill_in 'user[email]', with: 'Xin@123.com'
      fill_in 'user[password]', with: '123'
      click_button 'Create User'
      expect(page).to have_text "Failed to create" 
    end
  end

end