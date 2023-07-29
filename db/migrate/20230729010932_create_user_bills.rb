class CreateUserBills < ActiveRecord::Migration[7.0]
  def change
    create_table :user_bills do |t|
      t.references :bill, null: false, foreign_key: true
      t.integer :user_id

      t.timestamps
    end
    add_index :user_bills, :user_id
  end
end
