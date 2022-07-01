# frozen_string_literal: true

SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :home, "Home", root_path, icon: "home" do |sub_nav|
      sub_nav.item :settings, "Settings", edit_user_registration_path, icon: "adjustments"
      sub_nav.item :sign_out, "Sign Out", destroy_user_session_path, method: :delete, icon: "logout"
    end
  end
end
