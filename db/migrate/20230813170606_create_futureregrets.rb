class CreateFutureregrets < ActiveRecord::Migration[7.0]
  def change
    create_table :futureregrets do |t|
      t.string :title
      t.text :description
      t.text :action
      t.string :priority
      t.text :root_cause
      t.text :obstacles
      t.text :prevention
      t.references :futureregretlist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
