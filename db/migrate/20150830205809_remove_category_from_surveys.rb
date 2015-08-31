class RemoveCategoryFromSurveys < ActiveRecord::Migration
  def change
  	remove_column :surveys, :category
  end
end
