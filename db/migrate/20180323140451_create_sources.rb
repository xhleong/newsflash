class CreateSources < ActiveRecord::Migration[5.2]
  def change
    create_table :sources do |t|
      t.string :code
      t.string :name
      t.string :description
      t.string :url
      t.string :url_image
      t.string :category
      t.string :language
      t.string :country_code
      t.string :country_name

      t.timestamps
    end
  end
end
