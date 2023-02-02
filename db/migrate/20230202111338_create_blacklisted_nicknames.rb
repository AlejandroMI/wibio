# frozen_string_literal: true

class CreateBlacklistedNicknames < ActiveRecord::Migration[7.0]
  def change
    create_table :blacklisted_nicknames do |t|
      t.string :name

      t.timestamps
    end
  end
end
