class RemoveLatitudeAndLongitudeFromContact < ActiveRecord::Migration[6.0]
  def change
    remove_column :contacts, :latitude, :float
    remove_column :contacts, :longitude, :float

  end
end
