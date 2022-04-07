require 'rails_helper'
RSpec.describe PagesController, type: :controller do
  it 'should do the main page' do
    get :home
    expect(response).to be_successful
  end

  it 'should get the welcome screen' do
    get :welcome
    expect(response).to be_successful
  end
end
