class CreateRelationshipissuelists < ActiveRecord::Migration[7.0]
  def change
    create_table :relationshipissuelists do |t|
      t.string :timing
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
