# frozen_string_literal: true

class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.string :name, null: false
      t.string :url, null: false

      t.timestamps
    end
  end
end
