class CreateBills < ActiveRecord::Migration[7.0]
  def change
    create_table :bills do |t|
      t.integer :bill_id
      t.string :bill_number
      t.string :text_url
      t.string :last_action_date
      t.string :last_action
      t.string :title
      t.string :state

      t.timestamps
    end
  end
end
