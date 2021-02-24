class AddBasicInfoToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :profile_photo, :string
    add_column :users, :intro_text, :text
  end
end
