class SampleNameChangeColumnType < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :events, :accounts
    add_foreign_key :students, :events
  end
end
