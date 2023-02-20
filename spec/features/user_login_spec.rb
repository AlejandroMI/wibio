require 'rails_helper'

RSpec.feature 'User Login', type: :feature do
  scenario 'user finds log in link on the home page and navigate to the page' do
    visit root_path
    all(:link, "Log In").first.click
    expect(current_path).to eq new_user_session_path
    expect(page).to have_content('Sign in to your account')
    expect(page).to have_content('Or get started for free.')
  end
  scenario 'user logs in successfully when using right credentials and confirmed' do
    visit new_user_session_path
    user = create(:user, :confirmed)
    fill_in 'Login', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'
    expect(current_path).to eq root_path
    expect(page).to have_content('Signed in successfully.')
  end
  scenario 'user unable to log in unless confirmed' do
    visit new_user_session_path
    user = create(:user)
    fill_in 'Login', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'
    expect(current_path).to eq new_user_session_path
    expect(page).to have_content('You have to confirm your email address before continuing.')
  end
  scenario 'user unable to log in with wrong credentials' do
    visit new_user_session_path
    user = create(:user, :confirmed)
    fill_in 'Login', with: user.email
    fill_in 'Password', with: 'Wr0ngpassword'
    click_button 'Log In'
    expect(current_path).to eq new_user_session_path
    expect(page).to have_content('Invalid Login or password.')
  end
end
