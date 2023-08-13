class CreateEndgames < ActiveRecord::Migration[7.0]
  def change
    create_table :endgames do |t|
      t.string :title
      t.text :description
      t.text :obstacles
      t.text :initiate
      t.string :current_status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
