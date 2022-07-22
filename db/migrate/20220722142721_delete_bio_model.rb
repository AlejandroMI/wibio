class DeleteBioModel < ActiveRecord::Migration[7.0]
  def change
    drop_table(:bios)
  end
end
