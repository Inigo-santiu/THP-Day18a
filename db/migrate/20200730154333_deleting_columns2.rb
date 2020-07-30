class DeletingColumns2 < ActiveRecord::Migration[5.2]
  def change
  remove_column :patients, :city_id
  end
end
