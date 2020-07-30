class DeletingColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :doctors, :city_id
    remove_column :doctors, :zip_code
    remove_column :doctors, :speciality
  end
end
