class CreateDreamlifecomponents < ActiveRecord::Migration[7.0]
  def change
    create_table :dreamlifecomponents do |t|
      t.string :title
      t.text :description
      t.string :priority
      t.text :obstacles
      t.text :initiate
      t.string :current_status
      t.references :dreamlifelist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
