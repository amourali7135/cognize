class CreateRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :relationships do |t|
      t.text :person
      t.text :relationship
      t.text :issue
      t.text :initiate
      t.text :root_cause
      t.text :priority
      t.string :current_status
      t.references :relationshipissuelist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
