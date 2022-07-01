# frozen_string_literal: true

class CreateBios < ActiveRecord::Migration[7.0]
  def change
    create_table :bios do |t|
      t.belongs_to :user
      t.text :description

      t.timestamps
    end
  end
end
