class AddNameEsToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :name_es, :string
  end
end
