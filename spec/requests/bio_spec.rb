# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Bios", type: :request do
  describe "GET /edit" do
    xit "returns http success" do
      get "/bio/edit"
      expect(response).to have_http_status(:success)
    end
  end
end
