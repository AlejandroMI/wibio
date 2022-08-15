# frozen_string_literal: true

require "rails_helper"

RSpec.describe Link, type: :model do
  describe "Link creation" do
    it "should be valid with the factory" do
      expect(build(:link)).to be_valid
    end
    it "should not be valid without a name" do
      expect(build(:link, name: nil)).not_to be_valid
    end
    it "should not be valid without a url" do
      expect(build(:link, url: nil)).not_to be_valid
    end
    it "should not be valid without a bio" do
      expect(build(:link, bio: nil)).not_to be_valid
    end
    it "should not be valid with really long names" do
      # TODO: This must be reviewed based on UI constrains
      expect(build(:link, name: "Too l#{'o' * 1000}ng")).not_to be_valid
    end
    it "should only accept valid urls, starting with http or https" do
      valid_urls = %w(http://www.foufos.gr https://www.foufos.gr http://foufos.gr http://www.foufos.gr/kino http://werer.gr
                      http://t.co http://www.t.co https://www.t.co http://aa.com http://www.aa.com https://www.aa.com)
      valid_urls.each do |url|
        expect(build(:link, url:)).to be_valid
      end
    end
    it "should not accept invalid urls" do
      # TODO: Look for more invalid cases
      invalid_urls = %w(foufos foufos.gr www.mp3#.com www.foufos.gr www.mp3.com www.t.co http//:a.com https://)
      invalid_urls.each do |url|
        expect(build(:link, url:)).not_to be_valid
      end
    end
    it "should have an incremental position for each link created in the same bio" do
      first_link = create(:link)
      second_link = create(:link, bio: first_link.bio)
      expect(first_link.position).to eq(1)
      expect(second_link.position).to eq(2)
    end
    it "should have an incremental position for links in different bios, lists must be independent" do
      expect(create(:link).position).to eq(1)
      expect(create(:link).position).to eq(1)
    end
  end
  describe "#domain" do
    it "should return domain for factory" do
      expect(create(:link).domain).to eq("mylink.com")
    end
    it "should return domain for urls with paths" do
      expect(create(:link, url: "https://mylink.com/user/1234/profile").domain).to eq("mylink.com")
    end
    it "should return full domain for urls with subdomains" do
      expect(create(:link, url: "https://links.mylink.com/user/1234/profile").domain).to eq("links.mylink.com")
    end
  end
end
