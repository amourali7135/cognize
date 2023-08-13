class CreateRegretlists < ActiveRecord::Migration[7.0]
  def change
    create_table :regretlists do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
