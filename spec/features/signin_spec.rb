require 'rails_helper'

describe "the signin process", type: :feature do
  before { create(:user, email: 'user@example.com', password: 'password')  }

  it "signs me in" do
    visit user_session_path
    
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    
    click_button 'Login'
    expect(page).to have_content 'Signed in successfully.'
  end
end