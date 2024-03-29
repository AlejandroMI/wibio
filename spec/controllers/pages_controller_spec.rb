# frozen_string_literal: true

require "rails_helper"
RSpec.describe PagesController, type: :controller do
  it "should do the main page" do
    get :home
    expect(response).to be_successful
  end
end
