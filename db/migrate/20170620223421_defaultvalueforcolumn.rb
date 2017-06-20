class Defaultvalueforcolumn < ActiveRecord::Migration[5.0]
  def change
    add_column :cat_rental_requests, :status, :text, :null => false, :default => "PENDING"
  end
end
