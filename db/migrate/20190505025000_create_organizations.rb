class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :name, nullable: false

      t.timestamps
    end
  end
end
