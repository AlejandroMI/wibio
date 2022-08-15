# frozen_string_literal: true

class CreateBios < ActiveRecord::Migration[7.0]
  def change
    create_table :bios do |t|
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
