class CreatePolylistitems < ActiveRecord::Migration[7.0]
  def change
    create_table :polylistitems do |t|
      t.string :title
      t.text :description
      t.string :priority
      t.text :obstacles
      t.text :initiate
      t.string :current_status
      t.references :list_item, polymorphic: true, null: false

      t.timestamps
    end
  end
end
