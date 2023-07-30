class CreateUserStates < ActiveRecord::Migration[7.0]
  def change
    create_table :user_states do |t|
      t.references :state, null: false, foreign_key: true
      t.integer :user_id

      t.timestamps
    end
    add_index :user_states, :user_id
  end
end
