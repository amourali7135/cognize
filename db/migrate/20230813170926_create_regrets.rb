class CreateRegrets < ActiveRecord::Migration[7.0]
  def change
    create_table :regrets do |t|
      t.string :title
      t.text :description
      t.text :root_cause
      t.text :prevention_later
      t.text :lesson_learned
      t.text :priority
      t.boolean :closure
      t.text :achieve_closure
      t.references :regretlist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
