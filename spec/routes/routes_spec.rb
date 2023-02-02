# frozen_string_literal: true

require "rails_helper"

RSpec.describe "routes" do
  describe "application routes are restricted to certain scopes" do
    Rails.application.routes.routes.each do |route|
      path = route.path.spec.to_s

      it "route #{path} is within defined app scopes so there is no clashes with nicknames" do
        expect(path).to start_with("/:nickname") | # routes to wibio pages based on nickname
                          start_with("/rails") | # rails stuff
                          start_with("/x") | # active admin
                          start_with("/assets") | # assets
                          start_with("/cable") | # action cable
                          start_with("/x") | # active admin
                          start_with("/a") | # application
                          start_with("/d") | # devise
                          eq("/recede_historical_location(.:format)") | # turbo
                          eq("/resume_historical_location(.:format)") | # turbo
                          eq("/refresh_historical_location(.:format)") | # turbo
                          eq("/") # root
      end
    end
  end
end
