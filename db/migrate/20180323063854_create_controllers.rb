class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.text :languages, array:true, default:[]
      t.text :portals, array:true, default:[]
      t.text :categories, array:true, default:[]
      t.text :countries, array:true, default:[]
      t.text :keywords, array:true, default:[]

      t.references :user
      t.timestamps
    end
  end
end
