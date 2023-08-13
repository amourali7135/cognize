class CreateDreamlegacies < ActiveRecord::Migration[7.0]
  def change
    create_table :dreamlegacies do |t|
      t.text :memorialized
      t.text :epitaph
      t.text :remembered_for
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
