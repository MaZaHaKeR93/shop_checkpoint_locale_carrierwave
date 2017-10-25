class ChangeColumnsInProducts < ActiveRecord::Migration
  def change
  	rename_column :products, :title, :title_en
  	rename_column :products, :description, :description_en
  end
end
