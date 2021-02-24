class ChangeTypeOfColumn < ActiveRecord::Migration[6.1]
def up
  change_column :students, :visit, :boolean, default: false
end

def down
  change_column :students, :visit, :boolean, default: nil
end
end
