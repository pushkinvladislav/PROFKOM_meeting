class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.references :event, null: false, foreign_key: true
      t.string :second_name
      t.string :first_name
      t.string :email
      t.string :group
      t.string :faculty
      t.string :bilet
      t.string :phone
      t.string :vk_id
      t.boolean :visit

      t.timestamps
    end
  end
end
