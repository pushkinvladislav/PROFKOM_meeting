class AddQrcodeToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :qrcode, :string
  end
end
