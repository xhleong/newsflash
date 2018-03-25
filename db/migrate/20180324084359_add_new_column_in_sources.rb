class AddNewColumnInSources < ActiveRecord::Migration[5.2]
  def change
    add_column :sources, :language, :string
  end
end
