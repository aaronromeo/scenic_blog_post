class CreateMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :memberships do |t|
      t.references :user, foreign_key:  { on_delete: :cascade }
      t.references :organization, foreign_key:  { on_delete: :cascade }

      t.timestamps
    end
  end
end
