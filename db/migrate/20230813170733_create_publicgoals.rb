class CreatePublicgoals < ActiveRecord::Migration[7.0]
  def change
    create_table :publicgoals do |t|
      t.string :title
      t.text :description
      t.text :obstacles
      t.string :priority
      t.text :initiate
      t.string :current_status
      t.references :publicgoallist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
