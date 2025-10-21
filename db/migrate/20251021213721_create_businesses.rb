class CreateBusinesses < ActiveRecord::Migration[8.0]
  def change
    create_table :businesses, id: :uuid do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.references :created_by, type: :uuid, foreign_key: { to_table: :users }, null: true

      t.timestamps
    end
  end
end
