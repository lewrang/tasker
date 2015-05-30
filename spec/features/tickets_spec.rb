require 'rails_helper'

feature 'tickets' do
    before :each do
      @ticket1 = create(:ticket)
      @ticket2 = create(:ticket)
      @user = create(:user)
  end
  
  describe 'user_visit_tickets_page', type: :feature do
    it 'user see list of tickets' do
      visit tickets_path
      expect(page).to have_content('Log In')
      
      fill_in 'user[email]', :with => @user.email
      fill_in 'user[password]', :with => "password"
      click_button 'Log in'
      
      visit tickets_path
      expect(page).to have_content('Tickets')
      expect(page).to have_content(@ticket1.title)
      expect(page).to have_content(@ticket2.title)
    end

  end
end