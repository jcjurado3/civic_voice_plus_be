class UpdateColumnInStates < ActiveRecord::Migration[7.0]
  def change
    rename_column :states, :abbv_name, :state_abbr
  end
end
