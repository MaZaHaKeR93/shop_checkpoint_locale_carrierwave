class AddColumnsToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :title_ru, :string
  	add_column :products, :description_ru, :string
  end
end
