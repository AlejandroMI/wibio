# frozen_string_literal: true

module FeaturesHelpers
  def login(user)
    visit new_user_session_path
    fill_in "Login", with: user.email
    fill_in "Password", with: user.password
    click_button "Log In"
  end
end
