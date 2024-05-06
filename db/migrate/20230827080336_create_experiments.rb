class CreateExperiments < ActiveRecord::Migration[7.0]
  def change
    create_table :experiments do |t|
      t.string :title
      t.text :description
      t.text :obstacles
      t.text :initiate
      t.string :priority
      t.string :current_status
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
