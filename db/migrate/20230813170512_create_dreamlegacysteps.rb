class CreateDreamlegacysteps < ActiveRecord::Migration[7.0]
  def change
    create_table :dreamlegacysteps do |t|
      t.string :title
      t.text :description
      t.text :obstacles
      t.text :initiate
      t.string :current_status
      t.references :dreamlegacy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
