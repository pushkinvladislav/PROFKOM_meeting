class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.references :account, null: false, foreign_key: true
      t.string :name
      t.string :information
      t.string :photo
      t.boolean :activation
      t.timestamps
    end
  end
end
