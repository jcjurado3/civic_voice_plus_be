class RemoveFieldsFromBills < ActiveRecord::Migration[7.0]
  def change
    remove_column :bills, :text_url
    remove_column :bills, :last_action
    remove_column :bills, :last_action_date
    remove_column :bills, :title
  end
end
