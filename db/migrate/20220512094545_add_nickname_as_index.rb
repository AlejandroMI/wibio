# frozen_string_literal: true

class AddNicknameAsIndex < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :nickname, unique: true
  end
end
