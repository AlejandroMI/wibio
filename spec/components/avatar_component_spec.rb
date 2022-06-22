# frozen_string_literal: true

require "rails_helper"

RSpec.describe AvatarComponent, type: :component do
  context 'for an user without an avatar attached' do
    before(:all) do
      @html = render_inline(described_class.new(user: create(:user), size: 10)).to_html
    end
    it "renders without raising an error" do
      expect{ @html }.not_to raise_error
    end
    it 'should render right class size' do
      expect(@html).to include("height: 40px; width: 40px")
    end
    it 'renders a default image from the avatars folder' do
      expect(@html).to include('src="/assets/avatars/')
    end
    it 'has an alt attribute' do
      expect(@html).to include("alt=")
    end
  end
  context 'for an user with an avatar attached' do
    before(:all) do
      @html = render_inline(described_class.new(user: create(:user, :with_avatar), size: 24)).to_html
    end
    it "renders without raising an error" do
      expect{ @html }.not_to raise_error
    end
    it 'should render right size' do
      expect(@html).to include("height: 96px; width: 96px")
    end
    it 'renders a custom image' do
      expect(@html).to include('/monalisa.jpeg')
    end
    it 'has an alt attribute' do
      expect(@html).to include("alt=")
    end
  end
end
