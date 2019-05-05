class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name, nullable: false
      t.references :organization, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
