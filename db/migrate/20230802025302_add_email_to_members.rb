class AddEmailToMembers < ActiveRecord::Migration[7.0]
  def change
    add_column :members, :email, :string
  end
end
