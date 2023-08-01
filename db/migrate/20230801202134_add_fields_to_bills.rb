class AddFieldsToBills < ActiveRecord::Migration[7.0]
  def change
    add_column :bills, :status, :integer
    add_column :bills, :sponsors, :text
    add_column :bills, :texts, :text
    add_column :bills, :description, :string
  end
end
