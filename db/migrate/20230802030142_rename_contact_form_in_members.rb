class RenameContactFormInMembers < ActiveRecord::Migration[7.0]
  def change
    rename_column :members, :contact_form, :image_url
  end
end
