require 'rails_helper'

RSpec.feature 'User Signup', type: :feature do
  scenario 'user can find sign up link on the home page and navigate to the page' do
    visit root_path
    click_link 'Sign Up'
    expect(current_path).to eq new_user_registration_path
    expect(page).to have_content('Sign up')
    expect(page).to have_content('Or log in into your account.')
  end

  scenario 'user signs up successfully and is told to open confirmation email' do
    sign_up_user
    expect(page).to have_content('A message with a confirmation link has been sent to your email address.')
  end

  scenario 'user receives confirmation email and confirms account' do
    sign_up_user

    # Check that a confirmation email was sent
    confirmation_email = ActionMailer::Base.deliveries.last
    expect(confirmation_email.to.first).to eq 'human@earth.com'
    expect(confirmation_email.subject).to eq 'Confirmation instructions'

    # Extract the confirmation link from the email body (first link is logo one)
    confirmation_link = confirmation_email.body.to_s.scan(/href="([^"]+)"/)[1].first

    # Visit the confirmation link and assert that the user is confirmed and redirected to the welcome page
    visit confirmation_link
    expect(page).to have_content 'Your email address has been successfully confirmed.'
    expect(current_path).to eq welcome_path

    # The user can successfully finish its profile and its taken to the home page
    fill_in 'About', with: "Hey it's me!"
    click_button 'Finish Profile'
    expect(current_path).to eq root_path
  end

  scenario 'user tries to signs up without filling fields, error messages are working' do
    visit new_user_registration_path
    click_button 'Sign Up'
    expect(page).to have_content("Nickname can't be blank")
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
    expect(page).to have_content("Full name can't be blank")
  end
end

def sign_up_user
  visit new_user_registration_path
  fill_in 'Nickname', with: 'human'
  fill_in 'Full name', with: 'Human Earth'
  fill_in 'Email', with: 'human@earth.com'
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'
  click_button 'Sign Up'
end