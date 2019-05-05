class CreateNotificationPreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :notification_preferences do |t|
      t.references :user, foreign_key: { on_delete: :cascade }
      t.string :settable_type
      t.integer :settable_id
      t.string :notification_type
      t.string :notification_frequency

      t.timestamps
    end
  end
end
