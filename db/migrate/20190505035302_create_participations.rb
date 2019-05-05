class CreateParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :participations do |t|
      t.references :event, foreign_key: { on_delete: :cascade }
      t.references :user, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
