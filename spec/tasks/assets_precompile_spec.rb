# frozen_string_literal: true

require "rails_helper"
require "rake"

Rails.application.load_tasks if Rake::Task.tasks.empty?

RSpec.describe "assets", type: :task do
  describe "rake assets:precompile" do
    let(:task) { Rake::Task["assets:precompile"] }

    it "does not throw an error when disabling css compressor" do
      expect { task.invoke }.not_to raise_error
    end

    it "makes sure that compressor is disabled in production" do
      file = File.read("config/environments/production.rb")
      expect(file).to include("config.assets.css_compressor = nil")
    end
  end
end
