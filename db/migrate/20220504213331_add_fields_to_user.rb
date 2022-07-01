# frozen_string_literal: true

class AddFieldsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :full_name, :string, limit: 70
    add_column :users, :about, :string, limit: 140
  end
end
