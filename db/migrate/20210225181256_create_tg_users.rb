class CreateTgUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :tg_users do |t|
      t.string :name
      t.integer :telegram_id
      t.string :step

      t.timestamps
    end
    
  end
end
