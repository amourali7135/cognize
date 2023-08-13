class CreateBadhabits < ActiveRecord::Migration[7.0]
  def change
    create_table :badhabits do |t|
      t.string :title
      t.text :description
      t.text :reason
      t.text :initiate
      t.string :priority
      t.text :obstacles
      t.string :current_status
      t.references :badhabitlist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
