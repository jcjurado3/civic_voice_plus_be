class CreateStates < ActiveRecord::Migration[7.0]
  def change
    create_table :states do |t|
      t.string :abbv_name

      t.timestamps
    end
  end
end
