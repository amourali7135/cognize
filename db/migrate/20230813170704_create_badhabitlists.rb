class CreateBadhabitlists < ActiveRecord::Migration[7.0]
  def change
    create_table :badhabitlists do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
