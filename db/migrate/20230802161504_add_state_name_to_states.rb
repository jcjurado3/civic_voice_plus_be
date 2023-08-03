class AddStateNameToStates < ActiveRecord::Migration[7.0]
  def change
    add_column :states, :state_name, :string
  end
end
