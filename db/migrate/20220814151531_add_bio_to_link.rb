class AddBioToLink < ActiveRecord::Migration[7.0]
  def change
    add_reference :links, :bio, foreign_key: true
  end
end
