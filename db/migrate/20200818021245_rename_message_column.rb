class RenameMessageColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :messages, :contentm, :content
  end
end
