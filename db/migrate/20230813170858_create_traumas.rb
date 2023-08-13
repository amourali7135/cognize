class CreateTraumas < ActiveRecord::Migration[7.0]
  def change
    create_table :traumas do |t|
      t.string :title
      t.text :description
      t.string :priority
      t.text :effects
      t.text :obstacles
      t.text :initiate
      t.string :current_status
      t.boolean :closure
      t.text :achieve_closure
      t.references :traumalist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
