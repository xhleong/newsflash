class ChangeColumnNameInSources < ActiveRecord::Migration[5.2]
  def change
    rename_column :sources, :language, :language_code
  end
end
